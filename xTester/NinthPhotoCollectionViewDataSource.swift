//
//  NinthPhotoCollectionViewDataSource.swift
//  xTester
//
//  Created by Dad on 11/5/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import PINCache
import BRYXBanner
import Locksmith
import PINRemoteImage
import AlamofireImage
import SwiftyJSON



class NinthPhotoCollectionViewDataSource: NSObject, UICollectionViewDataSource, Utils, JsonConvertible {
    
    // ======== Data related variables =========
    var photos = [NinthPhoto]()
    var itemsDictionary: [String:[String]] = [:]
    var itemsKeyArray:[String] = []
    
    
    
    
    
    let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
    let APIKey = "a6d819499131071f158fd740860a5a88"
    let method = "flickr.photos.getRecent"
    
    fileprivate static let dateFormatter: DateFormatter = {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    
    enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
    }

    
    
    fileprivate struct Storyboard
    {
        static let CellIdentifier = "NinthPhotoCollectionViewCell"
        static let showWebView = "ShowNinthPhotoDetailView"
    }
    
    
    /*
    
    
    // ========== Initilizer ===================================
    override init()    {
        super.init()
        
        print("DS: .....INIT ")
        
        
        
        
        let completionHandler: (Result<JSON>) -> Void  =
            
            {    result in
                // print("NinthViewController: Executing completeon handler after getJSONObject" )
                let jsonObj = result.value!
                
                // ======= lets' get some arrays and Dictionaryies from our JSON  ==========
                
                // get key array
                guard let photoKeyArray =  self.getKeyArray(from: jsonObj, key: "server")   else {
                    print("keyArray was null ...")
                    return
                }
                
                
                /*
                print("+++++++++++++++++  Key Array ---> key is \"server\" +++++++++++++++++++++++")
                print(photoKeyArray)
                print("+++++++++++++++++  end keyArray +++++++++++++++++++++")
                */
                
                
                // get Dictionary
                guard let photoItemsDictionary = self.getDictionary(from: jsonObj,  for: "server", keyArray: photoKeyArray, dataKey:"id") else {
                    //    guard let myDict = getDictionary(from: obj,  for: "server", keyArray: myKeyArray, dataKey:"id") else {
                    print("myDict was null..")
                    return
                }
                
                /*
                print("+++++++++++++++++  Dictonary +++++++++++++++++++++++")
                print(photoItemsDictionary)
                print("+++++++++++++++++  end Dictionary +++++++++++++++++++++")
                */
                
                
               OperationQueue.main.addOperation() {
                        self.itemsDictionary  = photoItemsDictionary  // populate the Items Dictionary
                        self.itemsKeyArray = photoKeyArray   // populate key array
                        print(" DS:  Variables have been set" )
                    
                }  // end operation
             
        } // end closure
        
        
        
        
        // Make a Async call to get our data
        let params = ["extras":"url_h,date_taken"]
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: APIKey)
        getJSONObject(for: url, rootPath: ["photos","photo"],  completionHandler: completionHandler)  // get a SwiftyJSON object
      
        
        
        
        
        
        
    }  // end init
    
    
    
    */
    
    
    
    
    
    
    
    // ======= How many Sections do we have ?  ==========
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        print("DS -> NumberOfSections:  \(self.itemsKeyArray.count)   ")
        //return 1
        print("Number of sections: \(self.itemsKeyArray.count)  ")
        //return self.itemsKeyArray.count
        
        return ( (self.itemsKeyArray.count)/10  )
        
    }

    
    
    
   
    
    
  
    // ===== How many Items in each section ?  ==============
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // print("DS: numberOfItemsInsection -->: \() ")
        
        
       // return photos.count
        
        
        
        return 7
        
        /*
        // Figure out how many Items in each section
        let sectionKey = itemsKeyArray[section-1]
        let sectionItemsArray = itemsDictionary[sectionKey]
        let sectionItemsCount = sectionItemsArray?.count
        print("Items for this section \(section) : \(sectionItemsCount)")
        
        
        return sectionItemsCount!
        */
        
        
        
    }
    
    
    
    
    
    
   
    // ======= get a Cell for our Collection View  ===========================
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
          //print("           1. cellForItemAtIndex ...Starting")
        
        
        
        //let identifier = "NinthPhotoCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! NinthPhotoCollectionViewCell
        let photo  = photos[(indexPath as NSIndexPath).row]
        //print("              2. cellForItemAtIndex : Calling updateWithImage ")
        cell.updateWithImage(photo.image)
        
         //print("      NinthPhotoCollectionViewCell : cellForItemAtIndex ...RETURNING a Cell")
        return cell
    } //end method
    
 
    
    
    // ========= get Section Header View ============================
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NinthPhotoSectionHeader", for: indexPath) as! NinthPhotoSectionHeaderView
        
        /*
        if let publisher = publishers.publisherForItemAtIndexPath(indexPath) {
            headerView.publisher = publisher
        }
        
        */
        
        //if let ninthPhoto = photos
        
        
        return headerView
    }
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    /*
    
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return publishers.numberOfSections
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return publishers.numberOfPublishersInSection(section)
    }
    
    fileprivate struct Storyboard
    {
        static let CellIdentifier = "PublisherCell"
        static let showWebView = "ShowWebView"
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! PublisherCollectionViewCell
        
        cell.publisher = publishers.publisherForItemAtIndexPath(indexPath)
        cell.editing = isEditing
        cell.delegate = self
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderView
        
        if let publisher = publishers.publisherForItemAtIndexPath(indexPath) {
            headerView.publisher = publisher
        }
        
        return headerView
    }
    
    

    
    
    */
    
    
    
    
    
    
} //end class
