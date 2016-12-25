//
//  TwelfthA2PhotoTableViewCell2.swift
//  xTester
//
//  Created by Dad on 11/21/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation


import Foundation
import UIKit


class TwelfthA2TableViewCell2: UITableViewCell {


  
  @IBOutlet weak var collectionView2: TwelfthA2CollectionView2!
  
  
    
  // This property controls the scrolled position for CollectinView
  // This property is set in the method
  //  tableView: UITableView, didEndDisplaying cell:
  // Look for that method in TwelfthA2TableViewDataSource.swift
  
  var collectionViewOffset: CGFloat {
    get {
      return collectionView2.contentOffset.x
    }
    set {
      collectionView2.contentOffset.x = newValue
    }
  }
  
  
  // Set the DataSource and Delegate
  func setCollectionViewDataSourceDelegate  <D: UICollectionViewDataSource,E: UICollectionViewDelegate> (dataSource: D,
                                             dataSourceDelegate: E, forRow row: Int) {
    
    collectionView2.dataSource = dataSource
    collectionView2.delegate = dataSourceDelegate
    collectionView2.tag = row
    collectionView2.reloadData()
    
  }
  
  
  
  
  
  
  



}
