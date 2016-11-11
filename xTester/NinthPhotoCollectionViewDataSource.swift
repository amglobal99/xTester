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
    
    
    // How many Items in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("        DataSource: collectonView count is: \(photos.count) \n *********************************")
        return photos.count
        
    }
    
   
    // Cell for Collection View
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //print("           1. cellForItemAtIndex ...Starting")
        let identifier = "NinthPhotoCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! NinthPhotoCollectionViewCell
        let photo  = photos[(indexPath as NSIndexPath).row]
        //print("              2. cellForItemAtIndex : Calling updateWithImage ")
        cell.updateWithImage(photo.image)
        
         //print("      NinthPhotoCollectionViewCell : cellForItemAtIndex ...RETURNING a Cell")
        return cell
    } //end method
    
 
    
} //end class
