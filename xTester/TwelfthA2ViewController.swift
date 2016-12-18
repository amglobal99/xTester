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


/**
  This is the main class for our TwelfthA2ViewController
  You arrive at this ViewController thru a segue from 'TwelfthAViewController'
 
  DataSource variables are set in the prepareForSegue method in TwelfthAViewController

 */

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
        
        
    
    // MARK: - ViewController events
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
            // Set the Delegate and DataSource for the TableView
            table.dataSource = tableviewDataSource
            table.delegate = tableviewDelegate
            //table.delegate = self
        
        
        // TODO: CHECK IF THIS IS BEST APPROACH
        
        (table.delegate as! TwelfthA2TableViewDataSource ).collectionView1DataSource = (self.collectionView1DataSource)!
        (table.delegate as! TwelfthA2TableViewDataSource ).collectionView3DataSource = (self.collectionView3DataSource)!
        
        
        
        // Completion Handler
            // let completionHandler: (Result<JSON>) -> Void  =
        
            // We will use a typealias ( defined in GlobalConstants.swift file)  in line below
             let completionHandler: ClosureJSON<Result<JSON> >  =
            
            {  [weak self] result in
                let jsonObj = result.value!
                // get list of Photos(returns array of 'TwelfthA2Photo' items)
                let itemsResult: TwelfthA2CollectionView3PhotoStore.TwelfthA2PhotosResult   = (self?.store.photosFromJsonObject(jsonObj))!
                
                // get array of Section titles
                guard let photoKeyArray =  self?.getSectionTitlesArray(from: jsonObj, key: self?.key)   else {
                    print("getKeyArray method returned a nil value.")
                    return
                }
                
                 print("+++++++++++++++++  Section Titles Array  +++++++++++++++++++++++")
                 print(photoKeyArray)
                 print("+++++++++++++++++  end Section Titles +++++++++++++++++++++")
                
                // get Section Title: Photos Dictionary
                guard let sectionPhotosDictionary = self?.store.sectionPhotosDictionary(from: jsonObj, for: self?.key) else {
                    print("Section Photo Items Dictionary is nil")
                    return
                }
                
                 print("+++++++++++++++++  Section Photos Dictonary +++++++++++++++++++++++")
                 print(sectionPhotosDictionary)
                 print("+++++++++++++++++  end Dictionary +++++++++++++++++++++")
                
                OperationQueue.main.addOperation() {
                        switch itemsResult {
                        case let .success(photos):
                            print(" We have total of \(photos.count)  photos ")
                            // Send values over to DataSource class (TwelfthA2CollectionView3DataSource.swift)
                            self?.collectionView3DataSource.photos = photos
                            self?.collectionView3DataSource.sections =  photoKeyArray
                            self?.collectionView3DataSource.sectionPhotoItems = sectionPhotosDictionary  // populate the Items Dictionary
                            
                            
                            //TODO: Check Retain Cycles
                            
                            
                            // ========== ?????????? Let's populate the store  .... NOT SURE IF THIS IS RIGHT WAY TO DO IT
                            self?.collectionView3DataSource.photoStore = TwelfthA2CollectionView3PhotoStore()
                             // =========================================================
                            
                            
                            
                            //FIXME: Check Memory LEAKS
                            
                            // =========== NOT SURE IF THIS IS PROPER WAY TO DO IT ======= CHECK RETAIN CYCLE ========
                            //self?.tableviewDelegate.collectionView3DataSource = (self?.collectionView3DataSource)!
                            
                            // =============================================================================
                            
                            
                        case .failure(let error):
                            self?.collectionView3DataSource.photos.removeAll()
                            print("     Error fetching recent photos \(error)")
                        }  // end switch
                }  // end operation
                
                
        } // end closure
        
        
        // Create a Async(Alamofire) request to get Json.
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: apiKey)
        getJSONObject(for: url, rootPath: rootPath, completionHandler: completionHandler)  // get a SwiftyJSON object

    }  // end viewDidLoad
    
    
        
        
       
        /**
         Function called during the segue from TwelfthA2ViewController to Detail View Controller
         */
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
        

        
        func updateDestinationData(destinationVC: TwelfthA2DetailViewController, indexPath: IndexPath)  {
            let photo = collectionView3DataSource.photoForItemAtIndexPath(indexPath: indexPath)
            destinationVC.photo = photo
            destinationVC.store = store
        }
    
        
        
        
        
        
        
    
}  // end class


