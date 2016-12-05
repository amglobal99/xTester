//
//  TwelfthA2CollectionView1DataSource.swift
//  xTester
//
//  Created by Dad on 11/24/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit



class TwelfthA2CollectionView1DataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let model: [[UIColor]] = generateRandomData()
    
    
    
    func collectionView(_ collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        //return model[collectionView.tag].count
        //return model[0].count
        return 7
    }
    
    
    /// Function gives us individual cell within Collection View
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       // print("Row is \(indexPath.row)   Section is : \(indexPath.section)  ")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelfthA2CollectionView1Cell", for: indexPath)
       // cell.backgroundColor = model[collectionView.tag][indexPath.item]
        cell.backgroundColor = model[0][indexPath.item]
        
        
        return cell
    }
    
    
    
    
    
    
    
    // Function to get Section Header View
    //
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView{
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "TwelfthA2CollectionView1SectionHeader",
                                                                         for: indexPath) as! TwelfthA2CollectionView1SectionHeader
        
        headerView.sectionLabel1.text = "Test CollView"
        return headerView
    }  // end method
    
    
    
    
} // end class
