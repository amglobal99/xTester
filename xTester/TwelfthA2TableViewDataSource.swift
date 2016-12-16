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
   
    
    // These are populated from TwelfthA2ViewController.swift ( closure section)
    var collectionView1DataSource: TwelfthA2CollectionView1DataSource!
    var collectionView3DataSource: TwelfthA2CollectionView3DataSource!
    
    
    // MARK: - TODO
    
    // ================= THIS MAY NEED CHNAGING ================================
    
    //var collectionView1DataSource = TwelfthA2CollectionView1DataSource()
    //var collectionView3DataSource = TwelfthA2CollectionView3DataSource()
    
    
    
    
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
        //print("Generating cell for row  \(indexPath.row) in section: \(indexPath.section) ")
        switch indexPath.row {
        case 0:
           // print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell1", for: indexPath)
            return cell
        case 1:
            //print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell2", for: indexPath)
            return cell
        case 2:
           // print("Row is : \(indexPath.row)  and section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell3", for: indexPath)
            return cell
        case 3:
           // print("Row is : \(indexPath.row)  and section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell4", for: indexPath)
            return cell
        case 4:
           // print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell5", for: indexPath)
            return cell
        case 5:
           // print("Row is : \(indexPath.row)  and Section : \(indexPath.section)   ")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell6", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell1", for: indexPath)
            return cell
        } // end switch
    }  // end func
    
    
    
    
    
    
   
    
    
    
    
    
    // MARK: - TableView DELEGATE Methods
    
    
    
    /// Function called before TableView cell is to be displayed
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            case 0:
                print("TableView willDisplayCell for row #1")
                guard let tableViewCell1 = cell as? TwelfthA2TableViewCell1 else { return }
                tableViewCell1.setCollectionViewDataSourceDelegate(dataSource: collectionView1DataSource, dataSourceDelegate: collectionView1DataSource, forRow: indexPath.row)
                tableViewCell1.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
            case 1:
                print("TableView willDisplayCell for row #2")
            case 2:
                print("TableView willDisplayCell for row #3")
                // ======== This controls the Collection View in row 3  ==========
                guard let tableViewCell3 = cell as? TwelfthA2TableViewCell3 else { return }
                tableViewCell3.setCollectionViewDataSourceDelegate(dataSource: collectionView3DataSource, dataSourceDelegate: collectionView3DataSource, forRow: indexPath.row)
                tableViewCell3.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
                print("=================================================================")
                
            case 3:
                print("TableView willDisplayCell for row #4")
            case 4:
                print("TableView willDisplayCell for row #5")
            case 5:
                print("TableView willDisplayCell for row #6")
            default:
                print("")
        } // end switch
    } // end func
    
    
    
    
    
    /// Function called before cell stops displaying.
    /// The offset position for collection views is saved here
    
     func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell,  forRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0:
                guard let tableViewCell = cell as? TwelfthA2TableViewCell1 else { return }
                storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
            case 1:
                print("")
            case 2:
                guard let tableViewCell = cell as? TwelfthA2TableViewCell3 else { return }
                // THIS IS WHERE WE SAVE THE OFFSET FOR THE COLL VIEW
                storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
            case 3:
                print("")
                
            case 4:
                print("")
                
            case 5:
                print("")
                
            default:
                print("case default")
        } // end switch
    } // end func
    
    
    
    
    /// Function determines the height of each cell within the TabelView
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat  {
        switch indexPath.row {
        case 0:
            return 120
        case 1:
            return 160
        case 2:
            return 220
        case 3:
            return 340
        case 4:
            return 240
        case 5:
            return 240
        default:
            return 200
        }
    }
    
    
    
    

    
    
    
}  // end class
