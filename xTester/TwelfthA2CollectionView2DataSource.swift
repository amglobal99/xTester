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
  var photos: [TwelfthA2Item2] = []   // This is the list of all our Photos
  var sections:[String] = []  // This is the array of names for our  sections
  var sectionPhotoItems:[String:[TwelfthA2Item2]] = [:]  // Dictionary holds Photos for each section title
  var photoStore: TwelfthA2CollectionView3PhotoStore!

  
  // MARK: - Structs
  fileprivate struct Storyboard     {
    static let CellIdentifier = "TwelfthA2CollectionView2Cell"
    static let showWebView = "ShowTwelfthA2Item2DetailView"
  }
  
  
  
  // MARK: - CollectionView DataSource methods
  
  
  
  /// Returns the number of sections to be used in the CollectionView
  /// - Parameter collectionView:   The CollectionView being used
  /// - Returns: An Integer showing how many sections
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return self.sections.count
  }
  
  
  
  /// Returns the number of Items in each section
  /// - Parameter collectionView: The CollectionView being processed
  /// - Parameter section: The section being worked on
  /// - Returns: An integer showing the number of items to be displayed in each section
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let itemsInSection = photosForSection(section)
    print("Coll View 2: Number of Items in section \(section) : \(itemsInSection.count)")
    return itemsInSection.count
  } // end func
  
  
  
  /// Function to get a Cell for a given IndexPath
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! TwelfthA2CollectionView2Cell
    
    let photo = photoForItemAtIndexPath(indexPath: indexPath)
    cell.idLabel.text = photo.bikeID
    cell.staddressLabel.text  = photo.stAddress1
    return cell
  } //end func
  
  
  
  /// Function to get Section Header View
  func collectionView(_ collectionView: UICollectionView,
                      viewForSupplementaryElementOfKind kind: String,
                      at indexPath: IndexPath) -> UICollectionReusableView{
    
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: "TwelfthA2CollectionView2SectionHeader",
                                                                     for: indexPath) as! TwelfthA2CollectionView2SectionHeader
    
    let rowNumber = (indexPath as IndexPath).row
    let sectionNumber = (indexPath as IndexPath).section
    print( "HEADER: Row is : \(rowNumber) and Section is: \(sectionNumber) ")
    let sectionLabel = sections[sectionNumber]  // Retrieve section title from our stored array
    print("Our section label is : \(sectionLabel) " )
    let title = "Section:: " + sectionLabel
    headerView.section2Label.text = title
    return headerView
  }
  
  
  
  
  // MARK: - CollectionView DELEGATE Methods
  
  
  /// Function executed as Cell is getting ready to be displayed
  public func collectionView (_ collectionView: UICollectionView,
                              willDisplay cell: UICollectionViewCell,
                              forItemAt indexPath: IndexPath )  {
    
   // let photo = photoForItemAtIndexPath(indexPath: indexPath)
    
  } //end method
  
  
  
  
  
  
  
  /// Function runs when a Cell is selected
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("didselect .......")
    
    
  }
  
  
  
  
  
  
  // MARK: - Index Related Methods
  
  /// Function returns the number of Items in given section.
  func photosForSection(_ sectionNumber: Int) -> [TwelfthA2Item2] {
    let sectionPhotos = photos.filter {
      $0.statusKey == String(sectionNumber)
    }
    return sectionPhotos
  }
  
  
  /// Function returns a Photo for the given indexpath
  func photoForItemAtIndexPath(indexPath: IndexPath) -> TwelfthA2Item2 {
    let rowNumber = (indexPath as IndexPath).row
    let sectionNumber = (indexPath as IndexPath).section
    // get the Photos in this particular section
    let sectionPhotos = photosForSection(sectionNumber)
    // get the Photo to process
    let photo = sectionPhotos[rowNumber]
    return photo
}



} // end class
    
