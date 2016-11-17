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
    
    
    // MARK: - Local Variables
    
    enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
    }
    
    fileprivate struct Storyboard     {
        static let CellIdentifier = "NinthPhotoCollectionViewCell"
        static let showWebView = "ShowNinthPhotoDetailView"
    }
    
    
    // ======== Data related variables =========
    var photos = [NinthPhoto]()   // This is the list of all our Photos
    var sections:[String] = []  // This is the array of names for our  sections
    var sectionItems: [String:[String]] = [:]   // This Dictionary uses section name as Key and an array of Photos for that section
    var sectionPhotoItems:[String:[NinthPhoto]] = [:]
    
    
   
    // MARK: - CollectionView DataSource methods
    
    
    
    // Function to tell us How many Sections do we have ?
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }

    
    // Function to tell us How many Items in each section ?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        print("Current section: \(section)")
        
        let sectionItemsArray = photos.filter {
            $0.datetakenUnknown == String(section)
        }
        
        print("NUmber of Items in section \(section) : \(sectionItemsArray.count)")
        
        return sectionItemsArray.count
        
    }  // end func
    
    
    
    
    
    // Function to get a Cell
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let photoTitleToDisplay: String
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! NinthPhotoCollectionViewCell
        let  rowNumber = indexPath.row
        let sectionNumber = indexPath.section
        print( "Row is : \(rowNumber) and Section is: \(sectionNumber) ")
        
        
        
        let sectionStr = String(sectionNumber)
        // Get photos for this section( Filter the photos array )
        let sectionPhotos = photos.filter{
            $0.datetakenUnknown == sectionStr
        }
        
        
        let photo = sectionPhotos[rowNumber]
        // let's get a truncated title for our Photo
        let photoTitle = photo.title
       
        // This can be chnaged later ... we're limiting length  to 10 char
        if photoTitle.characters.count <= 10 {
            photoTitleToDisplay = "-" + photoTitle
        } else {
            let index = photoTitle.index(photoTitle.startIndex, offsetBy: 8)
            photoTitleToDisplay = photoTitle.substring(to: index)
            
        }
        
        cell.photoIDLabel.text = photo.photoID
        cell.photoServerLabel.text = photoTitleToDisplay
        cell.updateWithImage(photo.image)
        
        return cell
    } //end method
    

    
    
    
    
    
    
    
    
    
    
    
    
    // Function to get Section Header View
    //
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView{
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "NinthPhotoSectionHeader",
                                                                         for: indexPath) as! NinthPhotoSectionHeaderView
        
        let  rowNumber = indexPath.row
        let sectionNumber = indexPath.section
        print( "HEADER: Row is : \(rowNumber) and Section is: \(sectionNumber) ")
        
        let sectionLabel = sections[sectionNumber]
        print("Our section label is : \(sectionLabel) " )
        let title = "Section :: " + sectionLabel
        headerView.sectionLabel.text = title
        
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
    
    
    */
    
    
/*
    
    fileprivate func photosInSection(_ index: Int) -> [NinthPhoto] {
     
        let section = sections[index]
     
        /*
        let photosInSection = publishers.filter {
            (publisher: Publisher) -> Bool in
            return publisher.section == section
        }
        */
        
        let items = sectionItems[section]
 
        return publishersInSection
    }

    
    
    
    */
    
    
    
    
} //end class
