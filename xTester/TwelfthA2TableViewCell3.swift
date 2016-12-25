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
    
    
    // Define an ourlet for our CollectionView
    @IBOutlet weak var collectionView3: TwelfthA2CollectionView3!
    
    
    // This property controls the scrolled position for CollectinView
    // This property is set in the method
    //  tableView: UITableView, didEndDisplaying cell:
    // Look for that method in TwelfthA2TableViewDataSource.swift
    
    var collectionViewOffset: CGFloat {
        get {
            return collectionView3.contentOffset.x
        }
        set {
            collectionView3.contentOffset.x = newValue
        }
    }
    
    
  /// Set the DataSource and Delegate
    func setCollectionViewDataSourceDelegate  <D: UICollectionViewDataSource,E: UICollectionViewDelegate> (dataSource: D,
                                               dataSourceDelegate: E, forRow row: Int) {
        
        collectionView3.dataSource = dataSource
        collectionView3.delegate = dataSourceDelegate
        collectionView3.tag = row
        collectionView3.reloadData()
    }
    
    
    
    
}  // end class


