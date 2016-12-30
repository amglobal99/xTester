//
//  DataService.swift
//  xTester
//
//  Created by Dad on 12/30/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation



class NatDataService {
  

  let store2: TwelfthA2CollectionView2PhotoStore?
  let store3: TwelfthA2CollectionView3PhotoStore?
  let collectionView1DataSource: TwelfthA2CollectionView1DataSource?
  let collectionView2DataSource: TwelfthA2CollectionView2DataSource?
  let collectionView3DataSource: TwelfthA2CollectionView3DataSource?
  let tableviewDataSource: TwelfthA2TableViewDataSource?
  let tableviewDelegate: TwelfthA2TableViewDataSource?
  let collectionView2DataSourcePhotoStore: TwelfthA2CollectionView2PhotoStore?
  let collectionView3DataSourcePhotoStore: TwelfthA2CollectionView3PhotoStore?
  

  init(store2: TwelfthA2CollectionView2PhotoStore ,
       store3: TwelfthA2CollectionView3PhotoStore,
       collectionView1DataSource: TwelfthA2CollectionView1DataSource   ,
       collectionView2DataSource: TwelfthA2CollectionView2DataSource   ,
       collectionView3DataSource: TwelfthA2CollectionView3DataSource   ,
       tableviewDataSource: TwelfthA2TableViewDataSource,
       tableviewDelegate: TwelfthA2TableViewDataSource,
       collectionView2DataSourcePhotoStore: TwelfthA2CollectionView2PhotoStore,
       collectionView3DataSourcePhotoStore: TwelfthA2CollectionView3PhotoStore
       )  {
          self.store2 = store2
          self.store3 = store3
          self.collectionView1DataSource = collectionView1DataSource
          self.collectionView2DataSource = collectionView2DataSource
          self.collectionView3DataSource = collectionView3DataSource
          self.tableviewDataSource = tableviewDataSource
          self.tableviewDelegate = tableviewDelegate
          self.collectionView2DataSourcePhotoStore = collectionView2DataSourcePhotoStore
          self.collectionView3DataSourcePhotoStore = collectionView3DataSourcePhotoStore
    
  } // end init
  
  
  
  
  func getTheItems() {
    
    
    
    
  }
  
  
  
  
} // end class
