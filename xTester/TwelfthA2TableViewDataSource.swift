//
//  TwelfthA2TableViewDataSource.swift
//  xTester
//
//  Created by Dad on 11/20/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


//class TwelfthA2TableViewDataSource: NSObject, UITableViewDataSource,  UICollectionViewDataSource, Utils, JsonConvertible {



 
class TwelfthA2TableViewDataSource  {
    
    // MARK: - Structs
    fileprivate struct Storyboard     {
        static let tableviewCellIdentifier = "TwelfthA2TableViewCell1"
        static let collviewCellIdentifier = "TwelfthA2CollectionViewCell1"
        static let showWebView = "ShowTwelfthA2PhotoDetailView"
    }
    
    
    
    
    
    /*
    
    // MARK: - Collection View Data Source Methods
    
    
    /**
     Returns the number of sections to be used in the CollectionView
     - Parameter collectionView:   The CollectionView being used
     - Returns: An Integer showing how many sections
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    /**
     Returns the number of Items in each section
     
     - Parameter collectionView: The CollectionView being processed
     - Parameter section: The section being worked on
     - Returns: An integer showing the number of items to be displayed in each section
     
     */
 
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }  // end func
    
    
    
    
    // Function to get a Cell
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.collviewCellIdentifier, for: indexPath) as! TwelfthA2PhotoCollectionViewCell
        return cell
    } //end method
    

    
    
    
    // MARK: - TableView DataSource Methods
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = UITableViewCell()
        return cell1
    }
    
    
    
    
    */
    
    
        
    
    
    
    
}  // end class
