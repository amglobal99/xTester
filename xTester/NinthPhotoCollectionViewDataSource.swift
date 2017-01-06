//
//  NinthPhotoCollectionViewDataSource.swift
//  xTester
//
//  Created by Dad on 11/5/16.
//  Copyright © 2016 Natsys. All rights reserved.
//
//  This class provides the data used by the ViewController (NinthViewController.swift)
//  What we need is first an aray of 'NinthPhoto' objects
//  We also need an array of Section titles
//  Once we have that, we just filter the photos array to suit our needs
//
//
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import PINRemoteImage
import PINCache



/// This class serves as the Data Source for the Photos collection view.

class NinthPhotoCollectionViewDataSource: NSObject, UICollectionViewDataSource, Utils, JsonConvertible {

    
    
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
    

  
    ///    Returns the number of sections to be used in the CollectionView
    ///    - Parameter collectionView:   The CollectionView being used
    ///    - Returns: An Integer showing how many sections
  
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }

    
  
    ///    Returns the number of Items in each section
    ///   - Parameter collectionView: The CollectionView being processed
    ///   - Parameter section: The section being worked on
    ///   - Returns: An integer showing the number of items to be displayed in each section
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let itemsInSection = photosForSection(section)
        print("Number of Items in section \(section) : \(itemsInSection.count)")
        return itemsInSection.count
    }  // end func
    
    
    
    
    /// Function to get a Cell
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
      
      
        let url = photo.remoteURL
        cell.imageView?.pin_setImage(from: url, placeholderImage: UIImage(named: "placeholder.png"))
        { result in
         // if let cell = self.photoCollectionView?.cellForItem(at: indexPath) as? NinthPhotoCollectionViewCell {
         // if let cellToUpdate = self.collView.cellForItem(at: indexPath)    {
           // print("Cell upating at row: \(rowNumber + 1) ")
            cell.setNeedsLayout()
          //}
      }
      
      
        // ++++++++++++ Old code..... uses Spinner Activity Control
      //cell.updateWithImage(photo.image
      
        return cell
    } //end method
    

  
  
  
    
    
    /// Function to get Section Header View
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
        
    } // end func
    
    
    
    // MARK: - Index Related Methods
   
    /// Function returns the number of Items in section
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
