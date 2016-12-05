//
//  TwelfthA2TableViewDataSource.swift
//  xTester
//
//  Created by Dad on 11/20/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


class TwelfthA2TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK: - Local Variables
    var storedOffsets:[Int:CGFloat] = [:]      // stores offset for each element in array
    var collectionView1DataSource: TwelfthA2CollectionView1DataSource!
    var collectionView3DataSource: TwelfthA2CollectionView3DataSource!
    
    // MARK: - Structs
    fileprivate struct Storyboard     {
        //static let tableviewCellIdentifier = "TwelfthA2TableViewCell1"
        //static let collviewCellIdentifier = "TwelfthA2CollectionViewCell1"
        //static let showWebView = "ShowTwelfthA2PhotoDetailView"
    }
    
    
   
    
    // MARK: - TableView DataSource methods
    
    /// Number of Sections in our TableView
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Number of rows in Section
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    
    /// Cell for each row within the TableView
     func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Generating cell for row  \(indexPath.row) in section: \(indexPath.section) ")
        switch indexPath.row {
        case 0:
            print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell1", for: indexPath)
            return cell
        case 1:
            print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell2", for: indexPath)
            // cell.backgroundColor = UIColor.blue
            return cell
        case 2:
            print("Row is : \(indexPath.row)  and section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell3", for: indexPath)
            return cell
        case 3:
            print("Row is : \(indexPath.row)  and section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell4", for: indexPath)
            return cell
        case 4:
            print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell5", for: indexPath)
            return cell
        case 5:
            print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell6", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell1", for: indexPath)
            return cell
        } // end switch
    }  // end func
    
    
    
    
        
    
}  // end class
