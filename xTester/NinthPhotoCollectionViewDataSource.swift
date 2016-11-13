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


// This class serves as the Data Source

class NinthPhotoCollectionViewDataSource: NSObject, UICollectionViewDataSource, Utils, JsonConvertible {
    
    
    // ======== Data related variables =========
    var photos = [NinthPhoto]()
    var itemsDictionary: [String:[String]] = [:]
    var itemsKeyArray:[String] = []
    
    fileprivate var sections:[String] = []

    
    
    
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
    
    
    
    
    
    
    // ======= How many Sections do we have ?  ==========
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //return 1
        //print("Number of sections: \(self.itemsKeyArray.count)  ")
        return self.itemsKeyArray.count
        //return ( (self.itemsKeyArray.count)/10  )
    }

    
    
    
   
    
    
  
    // ===== How many Items in each section ?  ==============
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        
        print("Current section: \(section)")
        
        //return 7
        
        
        // Figure out how many Items in each section
        let sectionKey = itemsKeyArray[section]
        let sectionItemsArray = itemsDictionary[sectionKey]
        let sectionItemsCount = sectionItemsArray?.count
        print("Items for this section \(section) : \(sectionItemsCount)")
        
        return sectionItemsCount!
       
        
        
        
    }  // end func
    
    
    
    
    
    
   
    // ======= get a Cell for our Collection View  ===========================
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print("           1. cellForItemAtIndex ...Starting")
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! NinthPhotoCollectionViewCell
        
        
        
        let photo  = photos[(indexPath as NSIndexPath).row]
        //print("              2. cellForItemAtIndex : Calling updateWithImage ")
        
        
        
        
        
        
        
        
        
        
        
        
        cell.updateWithImage(photo.image)
        
        return cell
    } //end method
    
 
    
    
    
    
    
    
    
    
    
    // ==================== get Section Header View ============================================================
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NinthPhotoSectionHeader", for: indexPath) as! NinthPhotoSectionHeaderView
        
        /*
        if let publisher = publishers.publisherForItemAtIndexPath(indexPath) {
            headerView.publisher = publisher
        }
        
        */
        
        
        
        
        
        let index  = indexPath.row
        let  title  = itemsKeyArray[index]
        headerView.sectionLabel.text =  title
        return headerView
        
    }  // end method
    
    

    
    
    /*
    
    // Let's figure out which  photos get listed in which section
    
    
    func photoForItemAtIndexPath(_ indexPath: IndexPath) -> NinthPhoto? {
        if (indexPath as NSIndexPath).section > 0 {
            let photos = photosForSection((indexPath as NSIndexPath).section)
            return photos[(indexPath as NSIndexPath).item]
        } else {
            return photos[(indexPath as NSIndexPath).item]
        }
    }
    
    
    
    func titleForSectionAtIndexPath(_ indexPath: IndexPath) -> String? {
        if (indexPath as NSIndexPath).section < sections.count {
            return sections[(indexPath as NSIndexPath).section]
        }
        return nil
    }
    
    
    

    
    fileprivate func photosForSection(_ index: Int) -> [Publisher] {
        let section = sections[index]
        let publishersInSection = publishers.filter {
            (publisher: Publisher) -> Bool in return publisher.section == section
        }
        return publishersInSection
    }

    */
    
    
    
    
    
    
    
    
    
    
    
    
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
