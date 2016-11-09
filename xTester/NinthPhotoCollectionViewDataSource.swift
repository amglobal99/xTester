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
        print("        NinthPhotoCollectionViewDataSource: collectonView count is: \(photos.count) ")
        return photos.count
        
    }
    
   
    
    // Cell for Collection View
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("      NinthPhotoCollectionViewCell : cell at index ...")
        
        
        
        let identifier = "NinthPhotoCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! NinthPhotoCollectionViewCell
        let photo  = photos[(indexPath as NSIndexPath).row]
       cell.updateWithImage(photo.image)
        
        return cell
        
    } //end method
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
} //end class
