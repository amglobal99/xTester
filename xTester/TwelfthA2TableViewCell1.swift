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
    
    
    @IBOutlet private weak var collectionView: TwelfthA2CollectionView1!
    
    var collectionViewOffset: CGFloat {
        get {
            return collectionView.contentOffset.x
        }
        
        set {
            collectionView.contentOffset.x = newValue
        }
    }
    
    
    
    func setCollectionViewDataSourceDelegate  <D: UICollectionViewDataSource & UICollectionViewDelegate> (dataSourceDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
    
    
    
    
    
    
}
