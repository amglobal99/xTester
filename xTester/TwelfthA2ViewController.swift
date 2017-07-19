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



///   This is the main class for our TwelfthA2ViewController
///   You arrive at this ViewController thru a segue from 'TwelfthAViewController'
///   DataSource variables are now set inside Initializers

    class TwelfthA2ViewController: UITableViewController, JsonConvertible {
      
        // MARK: - IBOutlets
        @IBOutlet weak var table: UITableView!   // Refernce to main TableView
      
      
         enum DetailViewSegueIdentifier: String {
            case ShowView1ItemDetail = "ShowView1ItemDetail"
            case ShowView2ItemDetail = "ShowView2ItemDetail"
            case ShowTwelfthA2PhotoDetail = "ShowTwelfthA2PhotoDetail"
         }
      
      
         // MARK:- Data Variables
         var store1: TwelfthA2CollectionView1PhotoStore!
         var store2: TwelfthA2CollectionView2PhotoStore!
          var store3: TwelfthA2CollectionView3PhotoStore!
      
         //var store1: StoreService!
         //var store2: StoreService!
         //var store3: StoreService!
      
         var collectionView1DataSource: TwelfthA2CollectionView1DataSource!
         var collectionView2DataSource: TwelfthA2CollectionView2DataSource!
         var collectionView3DataSource: TwelfthA2CollectionView3DataSource!
         var tableviewDataSource: TwelfthA2TableViewDataSource!   // This defines the DataSource for the TableView
         var tableviewDelegate: TwelfthA2TableViewDataSource!  // Delegate for TableView
         
         
          // MARK: - Local Variables
           var storedOffsets:[Int:CGFloat] = [:]      // stores offset for each element in array
           var sectionPhotoDictionary:[String:[NinthPhoto]] = [:]
           var sectionPhotoDictionary2:[String:[TwelfthA2Item2]] = [:]
           var testSite2Name = "BIKENYC"  // other options "GITHUB","FLICKR","TYPICODE"
           let testSite3Name = "FLICKR"
      
      
           // Operation queues
           var queue2 = OperationQueue()
           var queue3 = OperationQueue()
           
      
      

      
      
      
      
        // MARK: - Initializers
      
        /// The initializers were addded by me later.
        /// Here, we will inject property values in constructor instead of
        /// in the 'prepareForSegue' method in TwelfthAViewController.swift
        ///
        
      init(_ coder: NSCoder? = nil  ) {
            print("executing Main INIT")
        
         /*
            // Assign property values
            self.store2 = TwelfthA2CollectionView2PhotoStore()
            self.store3 = TwelfthA2CollectionView3PhotoStore()
            self.collectionView1DataSource = TwelfthA2CollectionView1DataSource()
            self.collectionView2DataSource = TwelfthA2CollectionView2DataSource()
            self.collectionView3DataSource = TwelfthA2CollectionView3DataSource()
            self.tableviewDataSource = TwelfthA2TableViewDataSource()
            self.tableviewDelegate =  TwelfthA2TableViewDataSource()
            
 
            // Inject value for store property in the CollectionView data sources
            self.collectionView2DataSource.photoStore = TwelfthA2CollectionView2PhotoStore()
            self.collectionView3DataSource.photoStore = TwelfthA2CollectionView3PhotoStore()
        
         */
         
      
            if let coder = coder {
                super.init(coder: coder)!
            } else {
                super.init(nibName: nil, bundle:nil)
            }
        } // end init
      
      
      convenience required init(coder: NSCoder) {
          print("Executing conveninec....INIT")
          self.init(coder)
        }
      
      
      
      /*
      
      // ++++++++++++ CUSTOM INITIALIZER ++++++++++++++++++++++++
       // This won't be called if you use a segue
      init(store2: TwelfthA2CollectionView2PhotoStore,
           store3: TwelfthA2CollectionView3PhotoStore,
           collectionView1DataSource: TwelfthA2CollectionView1DataSource,
           collectionView2DataSource: TwelfthA2CollectionView2DataSource,
           collectionView3DataSource: TwelfthA2CollectionView3DataSource,
           tableviewDataSource: TwelfthA2TableViewDataSource,
           tableviewDelegate:  TwelfthA2TableViewDataSource,
           collview2PhotoStore: TwelfthA2CollectionView2PhotoStore,
           collview3PhotoStore: TwelfthA2CollectionView3PhotoStore
        
           ) {
        print("NEW INIT being executed ")
        self.store2 = store2
        self.store3 = store3
        self.collectionView1DataSource = collectionView1DataSource
        self.collectionView2DataSource = collectionView2DataSource
        self.collectionView3DataSource = collectionView3DataSource
        self.tableviewDataSource = tableviewDataSource
        self.tableviewDelegate = tableviewDelegate
        self.collectionView2DataSource.photoStore = collview2PhotoStore
        self.collectionView3DataSource.photoStore = collview3PhotoStore
        
        
        super.init(nibName: nil, bundle:nil)

      }
      
      */
      
    
      
      
      
      
      
      // MARK: - ViewController events
    
        override func viewDidLoad() {
            super.viewDidLoad()
            print("viewDidLoad: TwelfthA2VC .....first line")
         
            // Set the Delegate and DataSource for the TableView
            table.dataSource = tableviewDataSource
            table.delegate = tableviewDelegate
         
            // TODO: CHECK IF THIS IS BEST APPROACH
            tableviewDelegate.collectionView1DataSource = self.collectionView1DataSource
            tableviewDelegate.collectionView2DataSource = self.collectionView2DataSource
            tableviewDelegate.collectionView3DataSource = self.collectionView3DataSource
         
            // uddate data for second and third rows
            updateDataForSecondTableRow()
            updateDataForThirdTableRow()
          
      }  // end viewDidLoad
    
      
      
      
      
      
      // MARK: - Data for Table Rows
      
      /// Function updates data sources for the second row for our TableView
      
      func updateDataForSecondTableRow() {
         
              // Create a weak reference to self to prevent strong cycle
              weak var weakSelf = self
         
              // Get access to test site details for Row #2
              guard let testSite2 = Constants.Configuration.TestSite(rawValue: testSite2Name) else {
                return
              }
              
              // Create a Block Operation
              let operation2 = BlockOperation(block: {
                
                   let completionHandler2: (Result<JSON>) -> Void  =
                        {  [weak self] result in
                           
                          guard let strongSelf = self else {
                            return
                          }
                          // Get the result from Alamofire request
                          let jsonObj2 = result.value!
                           
                          // get list of Photos(returns array of 'TwelfthA2Photo' items)
                          let itemsResult2  = strongSelf.store2.photosFromJsonObject(jsonObj2)
                           
                          // get array of Section titles
                          guard let photoKeyArray2 =  strongSelf.getSectionTitlesArray(from: jsonObj2, key: testSite2.key )   else {
                            print("Coll View 2: getKeyArray method returned a nil value.")
                            return
                          }
                           
                          // get Section Title: Photos Dictionary
                          guard let sectionPhotosDictionary2 = strongSelf.store2.sectionPhotosDictionary(from: jsonObj2, for: testSite2.key) else {
                            print("Coll View 2: Section Photo Items Dictionary is nil")
                            return
                          }
                          
                           // Add to main thread
                          OperationQueue.main.addOperation() {
                               switch itemsResult2 {
                               case let .success(photos):
                                 strongSelf.collectionView2DataSource.photos = photos
                                 strongSelf.collectionView2DataSource.sections =  photoKeyArray2
                                 strongSelf.collectionView2DataSource.sectionPhotoItems = sectionPhotosDictionary2  // populate Items Dictionary
                               case .failure(let error):
                                 strongSelf.collectionView2DataSource.photos.removeAll()
                                 print("    Coll View 2:  Error fetching recent photos \(error)")
                               }  // end switch
                           
                              // Reload data for Table
                              strongSelf.tableView.reloadData()
                           
                          }  // end OPerationQueue.main
                           
                           
                     } // end completionHandler closure
                   
               
                   // Create a Async(Alamofire) request to get Json data for Table Row #2
                   guard let url2 = weakSelf?.getSiteURL(baseURLString: testSite2.urlString, method: testSite2.method, parameters: testSite2.params, apiKey: testSite2.apiKey) else {
                     return
                   }
               
                   // get a SwiftyJSON object
                   weakSelf?.getJSONObject(for: url2, rootPath: testSite2.rootPath, completionHandler: completionHandler2)
              
              })  // end BlockOperation
              
              // ADD OPERATION TO QUEUE
              queue2.addOperation(operation2)
        
      } // end func
      
      
      
      
      /// Function updates data sources for the third row for TAbleView
      func updateDataForThirdTableRow() {
         
         print("     Executing updateDataForThirdTableRow .......")
         
        // Create a weak reference to self
        //weak var weakSelf = self
        
        // get access to test site details for Row #3
        guard let testSite3 = Constants.Configuration.TestSite(rawValue: testSite3Name) else {
          return
        }
         
         
         print (testSite3)

         
         
         
         
        // create a Block Operation
        let operation3 = BlockOperation(block: {
          
                // This is the request for Table Row # 3
                let completionHandler3: (Result<JSON>) -> Void  =
                  
                  {  [weak self] result in
                     
                     // Shown below is an example of using a typealias
                     // We will use a typealias ( defined in GlobalConstants.swift file)  in line below
                     // let completionHandler: ClosureJSON<Result<JSON> >  =
                     
                     
                    // Let's make sure we still have access to self i.e. it has not been deallocated
                    guard let strongSelf = self else {
                      return
                    }
                     
                    // get the result from Alamofire request
                    let jsonObj = result.value!
                     
                    // get list of Photos(returns array of 'TwelfthA2Photo' items)
                    let itemsResult: TwelfthA2CollectionView3PhotoStore.TwelfthA2PhotosResult   = strongSelf.store3.photosFromJsonObject(jsonObj)
                     
                    // get array of Section titles
                    guard let photoKeyArray =  strongSelf.getSectionTitlesArray(from: jsonObj, key: testSite3.key)   else {
                      print("Coll View 3: getKeyArray method returned a nil value.")
                      return
                    }
                     
                    // get Section Title: Photos Dictionary
                    guard let sectionPhotosDictionary = strongSelf.store3.sectionPhotosDictionary(from: jsonObj, for: testSite3.key) else {
                      print("Coll View 3: Section Photo Items Dictionary is nil")
                      return
                    }
                     
                    // Update variable values on main thread
                    OperationQueue.main.addOperation() {
                     
                         switch itemsResult {
                         case let .success(photos):
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
         
         
         
                // Create a Async(Alamofire) request to get Json data for Table Row #3
                guard let url3 = self.getSiteURL(baseURLString: testSite3.urlString, method: testSite3.method, parameters: testSite3.params, apiKey: testSite3.apiKey) else {
                  return
                }
                self.getJSONObject(for: url3, rootPath: testSite3.rootPath, completionHandler: completionHandler3)  // get a SwiftyJSON object
                
        }) // end BlockOperation
        
        
        // ADD OPERATION TO QUEUE
        queue3.addOperation(operation3)
        
      }  // end func
      
      
      
      
      
      
      // MARK: - View Transition
      
      ///Function called during the segue from TwelfthA2ViewController to Detail View Controller.
      override   public func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
         print("Starting prepareForSegue in TwelfthA2VC.")
         
         if let segueIdentifier =  DetailViewSegueIdentifier(rawValue:  segue.identifier!)  {
         
               switch segueIdentifier {
                     case .ShowView1ItemDetail:
                           print("view 1")
                     case .ShowView2ItemDetail:
                           print("view 2")
                     case .ShowTwelfthA2PhotoDetail:
                        print("printing from prepareForSegue ..... Case section")
                        let destinationVC = segue.destination as! TwelfthA2DetailViewController
                        let tableIdx = IndexPath(row: 2, section: 0)
                        let tabCell = self.tableView.cellForRow(at: tableIdx) as! TwelfthA2TableViewCell3
                        if let selectedIndexPath = tabCell.collectionView3.indexPathsForSelectedItems?.first {
                           updateDestinationData(destinationVC: destinationVC, indexPath: selectedIndexPath)
                        }
                  
               } // end  switch
         } // end if
       }  // end func
        

      
      
      /// Function updates details for photo object in Destination controlller
      /// - parameter destinationVC:  The controller that will display the Photo detail
      /// - parameter indexPath:      The indes for the photot item.
      /// - returns:                  Does not return anything
        func updateDestinationData(destinationVC: TwelfthA2DetailViewController, indexPath: IndexPath)  {
            let photo = collectionView3DataSource.photoForItemAtIndexPath(indexPath: indexPath)
            destinationVC.photo = photo
            destinationVC.store = store3
        }
      
     
      
}  // end class




























