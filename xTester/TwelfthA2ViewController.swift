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


///   This is the main class for our TwelfthA2ViewController
///   You arrive at this ViewController thru a segue from 'TwelfthAViewController'
///   DISREGARD: DataSource variables are set in the prepareForSegue method in TwelfthAViewController.
///   DataSource variables are now set inside Initializers

    class TwelfthA2ViewController: UITableViewController, JsonConvertible {
      
        // MARK: - IBOutlets
        @IBOutlet weak var table: UITableView!   // Refernce to main TableView
      
        // MARK: - Local Variables
        var storedOffsets:[Int:CGFloat] = [:]      // stores offset for each element in array
        var sectionPhotoDictionary:[String:[NinthPhoto]] = [:]
        var sectionPhotoDictionary2:[String:[TwelfthA2Item2]] = [:]
    
      
        // MARK:- Data Variables
        var store: TwelfthA2CollectionView3PhotoStore!
        var store2: TwelfthA2CollectionView2PhotoStore!
        var collectionView1DataSource: TwelfthA2CollectionView1DataSource!
        var collectionView2DataSource: TwelfthA2CollectionView2DataSource!
        var collectionView3DataSource: TwelfthA2CollectionView3DataSource!
        var tableviewDataSource: TwelfthA2TableViewDataSource!   // This defines the DataSource for the TableView
        var tableviewDelegate: TwelfthA2TableViewDataSource!  // Delegate for TableView
      
      
      
      
      
        // MARK: - Global Constants Variables
        let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
        let apiKey = Constants.Configuration.apiKey
        let method = Constants.Configuration.method
        let key  = Constants.Configuration.key
        var rootPath = Constants.Configuration.rootPath
        let dataKey = Constants.Configuration.dataKey
        let params = Constants.Configuration.params
      
      
        let baseURLString2  = Constants.Configuration.jsonTestUrl.bikeNYC.rawValue
        let apiKey2:String? = nil
        let method2:String? = nil
        let key2 = "statusKey"
        let rootPath2 = ["stationBeanList"]
        let dataKey2:String? = nil
        let params2: [String: String]?  = nil

      
      
      
      
   
      
        // MARK: - Initializers
        
        /// The initializers were addded by me later.
        /// Here, we will inject property values in constructor instead of
        /// in the 'prepareForSegue' method in TwelfthAViewController.swift
        ///
        
        init(_ coder: NSCoder? = nil) {
            print("Executing Init for TwelfthA2ViewController.swift")
            // Assign property values
            self.store = TwelfthA2CollectionView3PhotoStore()
            self.store2 = TwelfthA2CollectionView2PhotoStore()
            self.collectionView1DataSource = TwelfthA2CollectionView1DataSource()
            self.collectionView2DataSource = TwelfthA2CollectionView2DataSource()
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
            (table.delegate as! TwelfthA2TableViewDataSource ).collectionView2DataSource = (self.collectionView2DataSource)!
            (table.delegate as! TwelfthA2TableViewDataSource ).collectionView3DataSource = (self.collectionView3DataSource)!
          
          
          
          
          guard let testSite2 = Constants.Configuration.TestSite(rawValue: "BIKENYC") else {
            return
          }
        
          guard let testSite3 = Constants.Configuration.TestSite(rawValue: "FLICKR") else {
            return
          }
          
          
        
          
          
          
          // This is the request for Table Row #2
          
          let completionHandler2: (Result<JSON>) -> Void  =
            {  [weak self] result in
                  guard let strongSelf = self else {
                    return
                  }
                  // Get the result from Alamofire request
                  let jsonObj2 = result.value!
                  //print(jsonObj2)
                  // get list of Photos(returns array of 'TwelfthA2Photo' items)
                  let itemsResult2  = strongSelf.store2.photosFromJsonObject(jsonObj2)
                  // get array of Section titles
                  guard let photoKeyArray2 =  strongSelf.getSectionTitlesArray(from: jsonObj2, key: strongSelf.key2)   else {
                    print("Coll View 2: getKeyArray method returned a nil value.")
                    return
                  }
                  print("\n\n+++++++++ Coll View 2: Section Titles Array  ++++++++++++++")
                  print(photoKeyArray2)
                  // get Section Title: Photos Dictionary
                  guard let sectionPhotosDictionary2 = strongSelf.store2.sectionPhotosDictionary(from: jsonObj2, for: strongSelf.key2) else {
                    print("Coll View 2: Section Photo Items Dictionary is nil")
                    return
                  }
                  print("\n\n+++++++++ Coll View 2: Section Photos Dictionary +++++++++++")
                  print(sectionPhotosDictionary2)
                  
                  OperationQueue.main.addOperation() {
                    switch itemsResult2 {
                    case let .success(photos):
                      print(" Coll View 2: We have total of \(photos.count)  photos ")
                      strongSelf.collectionView2DataSource.photos = photos
                      strongSelf.collectionView2DataSource.sections =  photoKeyArray2
                      strongSelf.collectionView2DataSource.sectionPhotoItems = sectionPhotosDictionary2  // populate the Items Dictionary
                    case .failure(let error):
                      strongSelf.collectionView2DataSource.photos.removeAll()
                      print("    Coll View 2:  Error fetching recent photos \(error)")
                    }  // end switch
                    
                    // Reload data for Table
                    strongSelf.tableView.reloadData()
                  }  // end operation
              
          } // end closure
          
          // Create a Async(Alamofire) request to get Json data for Table Row #2.
          guard let url2 = getSiteURL(baseURLString: baseURLString2, method: method2, parameters: params2, apiKey: apiKey2) else {
            return
          }
          getJSONObject(for: url2, rootPath: rootPath2, completionHandler: completionHandler2)  // get a SwiftyJSON object
          
          
          
          
          // This is the request for Table Row # 3
          let completionHandler: (Result<JSON>) -> Void  =
            // Shown below is an example of using a typealias
            // We will use a typealias ( defined in GlobalConstants.swift file)  in line below
            // let completionHandler: ClosureJSON<Result<JSON> >  =
            
            {  [weak self] result in
              print("++++++++++++++ Executing FIRST handler")
              // Let's make sure we still have access to self i.e. it has not been deallocated
              guard let strongSelf = self else {
                return
              }
              // get the result from Alamofire request
              let jsonObj = result.value!
              // get list of Photos(returns array of 'TwelfthA2Photo' items)
              let itemsResult: TwelfthA2CollectionView3PhotoStore.TwelfthA2PhotosResult   = strongSelf.store.photosFromJsonObject(jsonObj)
              // get array of Section titles
              guard let photoKeyArray =  strongSelf.getSectionTitlesArray(from: jsonObj, key: strongSelf.key)   else {
                print("Coll View 3: getKeyArray method returned a nil value.")
                return
              }
              print("\n\n+++++++++  Coll View 3: Section Titles Array  ++++++++++++++")
              print(photoKeyArray)
              // get Section Title: Photos Dictionary
              guard let sectionPhotosDictionary = strongSelf.store.sectionPhotosDictionary(from: jsonObj, for: strongSelf.key) else {
                print("Coll View 3: Section Photo Items Dictionary is nil")
                return
              }
              print("\n\n+++++++++  Coll View 3: Section Photos Dictionary +++++++++++")
              print(sectionPhotosDictionary)
              
              OperationQueue.main.addOperation() {
                switch itemsResult {
                case let .success(photos):
                  print(" Coll View 3: We have total of \(photos.count)  photos ")
                  strongSelf.collectionView3DataSource.photos = photos
                  strongSelf.collectionView3DataSource.sections =  photoKeyArray
                  strongSelf.collectionView3DataSource.sectionPhotoItems = sectionPhotosDictionary  // populate the Items Dictionary
                case .failure(let error):
                  strongSelf.collectionView3DataSource.photos.removeAll()
                  print("   Coll View 3:  Error fetching recent photos \(error)")
                }  // end switch
                
                // Reload data for Table
                strongSelf.tableView.reloadData()
              }  // end operation
              
          } // end closure
          
          // Create a Async(Alamofire) request to get Json data for Table Row #1
          guard let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: apiKey) else {
            return
          }
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


