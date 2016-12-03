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

    class TwelfthA2ViewController: UITableViewController, UICollectionViewDelegate , Utils, JsonConvertible {
        
    
        // MARK: - Local Variables
        var storedOffsets:[Int:CGFloat] = [:]      // stores offset for each element in array
        var sectionPhotoDictionary:[String:[NinthPhoto]] = [:]
    
        // MARK:- Data Variables
        var store: TwelfthA2CollectionView3PhotoStore!
        var collectionView1DataSource: TwelfthA2CollectionView1DataSource!
        var collectionView3DataSource: TwelfthA2CollectionView3DataSource!
        
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
        
        // Completion Handler
        let completionHandler: (Result<JSON>) -> Void  =
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
                        // Send values over to DataSource class (NinthPhotoCollectionViewDataSource.swift)
                        self?.collectionView3DataSource.photos = photos
                        self?.collectionView3DataSource.sections =  photoKeyArray
                        self?.collectionView3DataSource.sectionPhotoItems = sectionPhotosDictionary  // populate the Items Dictionary
                        // ========== ?????????? Let's populate the store  .... NOT SURE IF THIS IS RIGHT WAY TO DO IT
                        self?.collectionView3DataSource.photoStore = TwelfthA2CollectionView3PhotoStore()
                         // =========================================================
                    case .failure(let error):
                        self?.collectionView3DataSource.photos.removeAll()
                        print("     Error fetching recent photos \(error)")
                    }  // end switch
                }  // end operation
                
                
        } // end closure
        
        // Create a Async(Alamofire) request to get jSON data
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: apiKey)
        getJSONObject(for: url, rootPath: rootPath, completionHandler: completionHandler)  // get a SwiftyJSON object
        

        
    }  // end viewDidLoad
    
    
        
        
        
        
        
    
    // MARK: - TableView DataSource methods
    
    /// Number of Sections in our TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Number of rows in Section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    

    /// Cell for each row within the TableView
    override func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Generating cell for row  \(indexPath.row) in section: \(indexPath.section) ")
        switch indexPath.row {
            case 0:
               print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell1", for: indexPath)
                return cell
            case 1:
                print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell2", for: indexPath)
                // cell.backgroundColor = UIColor.blue
                return cell
            case 2:
                print("Row is : \(indexPath.row)  and section : \(indexPath.section)   ")
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell3", for: indexPath)
                return cell
            case 3:
                print("Row is : \(indexPath.row)  and section : \(indexPath.section)   ")
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell4", for: indexPath)
                return cell
            case 4:
                print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell5", for: indexPath)
                return cell
            case 5:
                print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell6", for: indexPath)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell1", for: indexPath)
                return cell
        } // end switch
    }  // end func
    
    
        
    /// Function called before TableView cell is to be displayed
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
            switch indexPath.row {
                    case 0:
                        guard let tableViewCell1 = cell as? TwelfthA2TableViewCell1 else { return }
                        tableViewCell1.setCollectionViewDataSourceDelegate(dataSource: collectionView1DataSource, dataSourceDelegate: collectionView1DataSource, forRow: indexPath.row)
                        tableViewCell1.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
                    case 1:
                        print("case 1")
                    case 2:
                        // ======== This controls the Collection View in row 3  ==========
                        guard let tableViewCell3 = cell as? TwelfthA2TableViewCell3 else { return }
                        tableViewCell3.setCollectionViewDataSourceDelegate(dataSource: collectionView3DataSource, dataSourceDelegate: collectionView3DataSource, forRow: indexPath.row)
                        tableViewCell3.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
                    case 3:
                        print("case 3")
                    case 4:
                        print("case 4")
                    case 5:
                        print("case 5")
                    default:
                        print("case 1")
            } // end switch
    } // end func
    
        
        
    /// Function called before cell stops displaying
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell,  forRowAt indexPath: IndexPath) {
            switch indexPath.row {
                    case 0:
                        guard let tableViewCell = cell as? TwelfthA2TableViewCell1 else { return }
                        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
                    case 1:
                        print("case 11")
                    case 2:
                        print("case 22")
                
                    case 3:
                        print("case 33")
                        
                    case 4:
                        print("case 44")
                        
                    case 5:
                        print("case 55")
                        
                    default:
                        print("case 11")
            } // end switch
    } // end func
    
        
        
    /// Function determines the height of each cell within the TabelView
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat  {
        switch indexPath.row {
            case 0:
                return 120
            case 1:
                return 320
            case 2:
                return 220
            case 3:
                return 340
            case 4:
                return 240
            case 5:
                return 240
            default:
                return 200
        }
    }
    
        
        
    
}  // end class


