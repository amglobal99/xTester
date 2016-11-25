//
//  TwelfthA2TableViewCell1.swift
//  xTester
//
//  Created by Dad on 11/21/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


class TwelfthA2TableViewCell1: UITableViewCell {
    
    
     // @IBOutlet private weak var collectionView: TwelfthA2CollectionView1!
    
    
    @IBOutlet weak var collectionView1: TwelfthA2CollectionView1!
    
    
    var collectionViewOffset: CGFloat {
        get {
            return collectionView1.contentOffset.x
        }
        
        set {
            collectionView1.contentOffset.x = newValue
        }
    }
    
    
    
    func setCollectionViewDataSourceDelegate  <D: UICollectionViewDataSource & UICollectionViewDelegate> (dataSourceDelegate: D, forRow row: Int) {
        collectionView1.delegate = dataSourceDelegate
        collectionView1.dataSource = dataSourceDelegate
        collectionView1.tag = row
        collectionView1.reloadData()
    }
    
    
    
    
    
    
}