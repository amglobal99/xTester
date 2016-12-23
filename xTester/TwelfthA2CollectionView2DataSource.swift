//
//  TwelfthA2CollectionView2DataSource.swift
//  xTester
//
//  Created by Dad on 12/23/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON


/**
 This class serves as the Data Source & Delegate for the Items collection view.
 
 */

class TwelfthA2CollectionView2DataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, Utils, JsonConvertible {
  
  
  // MARK: - Data Variables
  var photos = [TwelfthA2Photo]()   // This is the list of all our Photos
  var sections:[String] = []  // This is the array of names for our  sections
  var sectionPhotoItems:[String:[TwelfthA2Photo]] = [:]  // Dictionary holds Photos for each section title
  var photoStore: TwelfthA2CollectionView3PhotoStore!
  
  
  // MARK: - Enums
  enum Method: String {
    case RecentPhotos = "flickr.photos.getRecent"
  }
  
  
  // MARK: - Structs
  fileprivate struct Storyboard     {
    static let CellIdentifier = "TwelfthA2CollectionView3Cell"
    static let showWebView = "ShowTwelfthA2PhotoDetailView"
  }
  
  
  
  // MARK: - CollectionView DataSource methods
  
  
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
    print("Coll View 3: Number of Items in section \(section) : \(itemsInSection.count)")
    return itemsInSection.count
  }  // end func
  
  
  
  /// Function to get a Cell for a given IndexPath
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let photoTitleToDisplay: String
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! TwelfthA2CollectionView3Cell
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
  } //end func
  
  
  
  /// Function to get Section Header View
  func collectionView(_ collectionView: UICollectionView,
                      viewForSupplementaryElementOfKind kind: String,
                      at indexPath: IndexPath) -> UICollectionReusableView{
    
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: "TwelfthA2CollectionView3SectionHeader",
                                                                     for: indexPath) as! TwelfthA2CollectionView3SectionHeader
    
    let rowNumber = (indexPath as IndexPath).row
    let sectionNumber = (indexPath as IndexPath).section
    print( "HEADER: Row is : \(rowNumber) and Section is: \(sectionNumber) ")
    let sectionLabel = sections[sectionNumber]  // Retrieve section title from our stored array
    print("Our section label is : \(sectionLabel) " )
    let title = "Section :: " + sectionLabel
    headerView.section3Label.text = title
    return headerView
  }  // end func
  
  
  
  
  // MARK: - CollectionView DELEGATE Methods
  
  /**
   Function executed as Cell is getting ready to be displayed
   */
  public func collectionView (_ collectionView: UICollectionView,
                              willDisplay cell: UICollectionViewCell,
                              forItemAt indexPath: IndexPath )  {
    
    let photo = photoForItemAtIndexPath(indexPath: indexPath)
    photoStore.fetchImageForPhoto(photo)
    {    result in
      OperationQueue.main.addOperation() {
        // get Dictionary for photo items
        let sectionDict = self.sectionPhotoItems
        guard let path = self.photoStore.indexForPhoto(dict: sectionDict, photo: photo)  else {
          return
        }
        let photoRow = path.0
        let photoSection = path.1
        let photoIndexPath = IndexPath(row: photoRow , section: photoSection)
        // print("Indexpath (willDisplayCell) :   Section: \(photoSection!)   Row: \(photoRow!)")
        if let cell = collectionView.cellForItem(at: photoIndexPath) as?  TwelfthA2CollectionView3Cell {
          cell.updateWithImage(photo.image)     // Update cell photo
        }
      } //end operation
    } // end closure
    
  } //end method
  
  
  
  
  
  
  
  // Function runs when a Cell is selected
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("didselect .......")
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  // MARK: - Index Related Methods
  
  /// Function returns the number of Items in given section.
  func photosForSection(_ sectionNumber: Int) -> [TwelfthA2Photo] {
    let sectionPhotos = photos.filter {
      $0.datetakenUnknown == String(sectionNumber)
    }
    return sectionPhotos
  }
  
  
  /// Function returns a Photo for the given indexpath
  func photoForItemAtIndexPath(indexPath: IndexPath) -> TwelfthA2Photo {
    let rowNumber = (indexPath as IndexPath).row
    let sectionNumber = (indexPath as IndexPath).section
    // get the Photos in this particular section
    let sectionPhotos = photosForSection(sectionNumber)
    // get the Photo to process
    let photo = sectionPhotos[rowNumber]
    return photo
}



} // end class
    
