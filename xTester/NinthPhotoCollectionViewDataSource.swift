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
    var sections:[String] = []
    var sectionItems: [String:[String]] = [:]

    enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
    }

    fileprivate struct Storyboard     {
        static let CellIdentifier = "NinthPhotoCollectionViewCell"
        static let showWebView = "ShowNinthPhotoDetailView"
    }
    
    
    
    
    
    
    // ======= How many Sections do we have ?  ==========
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //return 1
        return self.sections.count
    }

    
    
  
    // ===== How many Items in each section ?  ==============
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        print("Current section: \(section)")
        
        // Figure out how many Items in each section
        let sectionKey = sections[section]
        print("section key : \(sectionKey) " )
        let sectionItemsArray = sectionItems[sectionKey]
        print("Section Items : \(sectionItemsArray)")
        let sectionItemsCount = sectionItemsArray?.count
        print("Items for this section \(section) : \(sectionItemsCount!)")
        
        return sectionItemsCount!
        
    }  // end func
    
    
    
    
    
    
    
    
   
    // ======= get a Cell for our Collection View  ===========================
    //
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //print("           1. cellForItemAtIndex ...Starting")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! NinthPhotoCollectionViewCell
        
        
        let  rowNumber = (indexPath as NSIndexPath).row
        print( "Row is : \(rowNumber) ")
        
        
        
        let photo  = photos[rowNumber]
        
        cell.photoIDLabel.text = photo.photoID
        cell.photoServerLabel.text = photo.photoID
        cell.updateWithImage(photo.image)
        
        return cell
    } //end method
    
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    // ==================== get Section Header View ==========================================
    // This function wil give us the Title for each section
    //
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NinthPhotoSectionHeader", for: indexPath) as! NinthPhotoSectionHeaderView
        
        let rowNumber  = (indexPath as NSIndexPath).row
        let  sectionTitle  = sections[rowNumber]
        headerView.sectionLabel.text =  sectionTitle
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
