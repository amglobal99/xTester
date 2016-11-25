//
//  TwelfthA2CollectionView2DataSource.swift
//  xTester
//
//  Created by Dad on 11/24/16.
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


/// This class serves as the Data Source for the Photos collection view.

class TwelfthA2CollectionView3DataSource: NSObject, UICollectionViewDataSource, Utils, JsonConvertible {
    
    
    
    // MARK: - Enums
    enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
    }
    
    
    // MARK: - Structs
    fileprivate struct Storyboard     {
        static let CellIdentifier = "NinthPhotoCollectionViewCell"
        static let showWebView = "ShowNinthPhotoDetailView"
    }
    
    
    // MARK: - Data Variables
    var photos = [NinthPhoto]()   // This is the list of all our Photos
    var sections:[String] = []  // This is the array of names for our  sections
    var sectionPhotoItems:[String:[NinthPhoto]] = [:]  // Dictionary holds Photos for each section title
    
    
    
    
    // MARK: - DataSource methods
    
    
    /**
     Returns the number of sections to be used in the CollectionView
     - Parameter collectionView:   The CollectionView being used
     - Returns: An Integer showing how many sections
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    
    /**
     Returns the number of Items in each section
     
     - Parameter collectionView: The CollectionView being processed
     - Parameter section: The section being worked on
     - Returns: An integer showing the number of items to be displayed in each section
     
     */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let itemsInSection = photosForSection(section)
        print("Number of Items in section \(section) : \(itemsInSection.count)")
        return itemsInSection.count
    }  // end func
    
    
    
    
    // Function to get a Cell
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let photoTitleToDisplay: String
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! NinthPhotoCollectionViewCell
        let photo = photoForItemAtIndexPath(indexPath: indexPath)
        
        // Get a truncated title for our Photo
        let photoTitle = photo.title
        // This can be changed later ... we're limiting length to 8 char
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
        
        let rowNumber = (indexPath as IndexPath).row
        let sectionNumber = (indexPath as IndexPath).section
        print( "HEADER: Row is : \(rowNumber) and Section is: \(sectionNumber) ")
        let sectionLabel = sections[sectionNumber]  // Retrieve section title from our stored array
        print("Our section label is : \(sectionLabel) " )
        let title = "Section :: " + sectionLabel
        headerView.sectionLabel.text = title
        
        return headerView
        
    }  // end method
    
    
    
    // MARK: - Index Related Methods
    
    // Function returns the number of Items in section
    //
    
    func photosForSection(_ sectionNumber: Int) -> [NinthPhoto] {
        // Get photos for this section (Filter the photos array)
        
        
        let sectionPhotos = photos.filter{
            $0.datetakenUnknown == String(sectionNumber)
            
        }
        
        
        /*
         for i in sectionPhotos{
         print("Section: \(sectionNumber) ----> Id: \(i.photoID)  ")
         }
         */
        return sectionPhotos
    }
    
    
    
    
    
    // Function returns a Photo for the given indexpath
    func photoForItemAtIndexPath(indexPath: IndexPath) -> NinthPhoto {
        let rowNumber = (indexPath as IndexPath).row
        let sectionNumber = (indexPath as IndexPath).section
        //print( "Func  Row is : \(rowNumber) and Section is: \(sectionNumber) ")
        // get the Photos in this particular section
        let sectionPhotos = photosForSection(sectionNumber)
        // get the Photo to process
        let photo = sectionPhotos[rowNumber]
        return photo
    } // end func
    
    
    
    
    
    
    
    
    
} //end class

