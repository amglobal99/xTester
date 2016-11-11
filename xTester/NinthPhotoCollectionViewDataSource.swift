//
//  NinthPhotoCollectionViewDataSource.swift
//  xTester
//
//  Created by Dad on 11/5/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


class NinthPhotoCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    
    var photos = [NinthPhoto]()
    
    
    fileprivate struct Storyboard
    {
        static let CellIdentifier = "NinthPhotoCollectionViewCell"
        static let showWebView = "ShowNinthPhotoDetailView"
    }
    
    
    
    // ======= How many Sections do we have ?  ==========
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    // ===== How many Items in each section ?  ==============
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("        DataSource: collectonView count is: \(photos.count) \n *********************************")
        return photos.count
        
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
