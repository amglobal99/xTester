//
//  TwelfthA2PhotoTableViewCell3.swift
//  xTester
//
//  Created by Dad on 11/21/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


class TwelfthA2TableViewCell3: UITableViewCell {
    
    
    @IBOutlet weak var collectionView3: TwelfthA2CollectionView3!
    
    
    var collectionViewOffset: CGFloat {
        get {
            return collectionView3.contentOffset.x
        }
        
        set {
            collectionView3.contentOffset.x = newValue
        }
    }
    
    
    
    func setCollectionViewDataSourceDelegate  <D: UICollectionViewDataSource & UICollectionViewDelegate> (dataSourceDelegate: D, forRow row: Int) {
        collectionView3.delegate = dataSourceDelegate
        collectionView3.dataSource = dataSourceDelegate
        collectionView3.tag = row
        collectionView3.reloadData()
    }
    
    
    

    
    
    
}
