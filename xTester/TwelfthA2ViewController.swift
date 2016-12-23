//
//  TwelfthA2ViewController.swift
//  xTester
//
//  Created by Dad on 11/10/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import BRYXBanner
import AlamofireImage
import SwiftyJSON


/// Defines a blueprint for all Stores to follow
protocol StoreService {
    
    associatedtype TA2JSON
    associatedtype TA2PhotosResult
    associatedtype TA2Photo
    associatedtype TA2ImageResult
    associatedtype TA2Data
    associatedtype TA2NSError
    associatedtype TA2String
   
    func fetchJsonObject()
    func photosFromJsonObject(_ json: TA2JSON)  -> TA2PhotosResult
    func photoFromJSONObject( _ json: TA2JSON ) -> TA2Photo?
    func fetchImageForPhoto( _ photo: TA2Photo, completion: @escaping (TA2ImageResult) -> Void )
    func processImageRequest( data: TA2Data?, error: TA2NSError?  )  -> TA2ImageResult
    func sectionPhotosDictionary( from obj:TA2JSON?, for key:TA2String? )  -> [String:[TA2Photo]]?
    func indexForPhoto( dict:[String:[TA2Photo]], photo:TA2Photo )  -> (Int,Int)?
    
} // end protocol


///  This is the main class for our TwelfthA2ViewController
///  You arrive at this ViewController thru a segue from 'TwelfthAViewController'
///   DISREGARD: DataSource variables are set in the prepareForSegue method in TwelfthAViewController.
///   DataSource variables are now set inside Initializers

    class TwelfthA2ViewController: UITableViewController, JsonConvertible {
      
        // MARK: - IBOutlets
        @IBOutlet weak var table: UITableView!   // Refernce to main TableView
      
        // MARK: - Local Variables
        var storedOffsets:[Int:CGFloat] = [:]      // stores offset for each element in array
        var sectionPhotoDictionary:[String:[NinthPhoto]] = [:]
    
        // MARK:- Data Variables
        var store: TwelfthA2CollectionView3PhotoStore!
        var collectionView1DataSource: TwelfthA2CollectionView1DataSource!
        var collectionView3DataSource: TwelfthA2CollectionView3DataSource!
        var tableviewDataSource: TwelfthA2TableViewDataSource!   // This defines the DataSource for the TableView
        var tableviewDelegate: TwelfthA2TableViewDataSource!  // Delegate for TableView
      
        // MARK: - Global Constants Variables
        let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
        let apiKey = Constants.Configuration.apiKey
        let method = Constants.Configuration.method
        let key  = Constants.Configuration.key
        let rootPath = Constants.Configuration.rootPath
        let dataKey = Constants.Configuration.dataKey
        let params = Constants.Configuration.params
      
        // MARK: - Initializers
        
        /// The initializers were addded by me later.
        /// Here, we will inject property values in constructor instead of
        /// in the 'prepareForSegue' method in TwelfthAViewController.swift
        ///
        
        init(_ coder: NSCoder? = nil) {
            print("Executing Init for TwelfthA2ViewController.swift")
            // Assign property values
            self.store = TwelfthA2CollectionView3PhotoStore()
            self.collectionView1DataSource = TwelfthA2CollectionView1DataSource()
            self.collectionView3DataSource = TwelfthA2CollectionView3DataSource()
            self.tableviewDataSource = TwelfthA2TableViewDataSource()
            self.tableviewDelegate =  TwelfthA2TableViewDataSource()
            
            // Let's assign a property in the CollectionView store
            self.collectionView3DataSource.photoStore = TwelfthA2CollectionView3PhotoStore()
            
            if let coder = coder {
                super.init(coder: coder)!
            } else {
                super.init(nibName: nil, bundle:nil)
            }
        }
      
        convenience required init(coder: NSCoder) {
            print("Executing CONVENINECE init for TwelfthA2ViewController.swift")
            self.init(coder)
        }
      
        // MARK: - ViewController events
    
        override func viewDidLoad() {
        
            super.viewDidLoad()
            // Set the Delegate and DataSource for the TableView
            table.dataSource = tableviewDataSource
            table.delegate = tableviewDelegate
        
            // TODO: CHECK IF THIS IS BEST APPROACH
            (table.delegate as! TwelfthA2TableViewDataSource ).collectionView1DataSource = (self.collectionView1DataSource)!
            (table.delegate as! TwelfthA2TableViewDataSource ).collectionView3DataSource = (self.collectionView3DataSource)!
          
            // Completion Handler
             let completionHandler: (Result<JSON>) -> Void  =
            // We will use a typealias ( defined in GlobalConstants.swift file)  in line below
            // let completionHandler: ClosureJSON<Result<JSON> >  =
            
            {  [weak self] result in
                // Let's make sure we still have access to self i.e. it has not been deallocated
                guard let strongSelf = self else {
                  return
                }
              
                             
                // Get the result from Alamofire request
                let jsonObj = result.value!
          
              
                // get list of Photos(returns array of 'TwelfthA2Photo' items)
                let itemsResult: TwelfthA2CollectionView3PhotoStore.TwelfthA2PhotosResult   = (strongSelf.store.photosFromJsonObject(jsonObj))
                // get array of Section titles
                guard let photoKeyArray =  strongSelf.getSectionTitlesArray(from: jsonObj, key: strongSelf.key)   else {
                    print("getKeyArray method returned a nil value.")
                    return
                }
                 print("\n\n+++++++++  Section Titles Array  ++++++++++++++")
                 print(photoKeyArray)
                // get Section Title: Photos Dictionary
                guard let sectionPhotosDictionary = strongSelf.store.sectionPhotosDictionary(from: jsonObj, for: strongSelf.key) else {
                    print("Section Photo Items Dictionary is nil")
                    return
                }
                 print("\n\n+++++++++  Section Photos Dictionary +++++++++++")
                 print(sectionPhotosDictionary)
                
                OperationQueue.main.addOperation() {
                        switch itemsResult {
                        case let .success(photos):
                            print(" We have total of \(photos.count)  photos ")
                            strongSelf.collectionView3DataSource.photos = photos
                            strongSelf.collectionView3DataSource.sections =  photoKeyArray
                            strongSelf.collectionView3DataSource.sectionPhotoItems = sectionPhotosDictionary  // populate the Items Dictionary
                        case .failure(let error):
                            strongSelf.collectionView3DataSource.photos.removeAll()
                            print("     Error fetching recent photos \(error)")
                        }  // end switch
                  
                    // Reload data for Table
                    strongSelf.tableView.reloadData()
                }  // end operation
              
        } // end closure
        
        // Create a Async(Alamofire) request to get Json.
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: apiKey)
        getJSONObject(for: url, rootPath: rootPath, completionHandler: completionHandler)  // get a SwiftyJSON object

    }  // end viewDidLoad
    
      
      
      
      
      
      
      
      
      
      
      // MARK: - View Transition
      
      ///Function called during the segue from TwelfthA2ViewController to Detail View Controller.
      override   public func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
            let segueIdentifier = segue.identifier!
            switch segueIdentifier  {
                case "ShowTwelfthA2PhotoDetail":
                    let destinationVC = segue.destination as! TwelfthA2DetailViewController
                    let tableIdx = IndexPath(row: 2, section: 0)
                    let tabCell = self.tableView.cellForRow(at: tableIdx) as! TwelfthA2TableViewCell3
                    if let selectedIndexPath = tabCell.collectionView3.indexPathsForSelectedItems?.first {
                        updateDestinationData(destinationVC: destinationVC, indexPath: selectedIndexPath)
                    }
                default:
                    // do nothing
                    break
            }  // end switch
        }  // end func
        

      /// Function updates details for photo object in Destination controlller
      /// - parameter destinationVC:  The controller that will display the Photo detail
      /// - parameter indexPath:      The indes for the photot item.
      /// - returns:                  Does not return anything
        func updateDestinationData(destinationVC: TwelfthA2DetailViewController, indexPath: IndexPath)  {
            let photo = collectionView3DataSource.photoForItemAtIndexPath(indexPath: indexPath)
            destinationVC.photo = photo
            destinationVC.store = store
        }
      
}  // end class


