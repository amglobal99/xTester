//
//  TwelfthA2ViewController.swift
//  xTester
//
//  Created by Dad on 11/10/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


//class TwelfthA2ViewController: UITableViewController,  UICollectionViewController, NinthPhotoCollectionViewCellDelegate, Utils, JsonConvertible {
    
    
    class TwelfthA2ViewController: UITableViewController,   Utils {
        
    
    
    // MARK: - Local Variables
    
        //let model:[[Any]]?
        //model[0] = generateRandomData()
        let model: [[UIColor]] = generateRandomData()
        var storedOffsets:[Int:CGFloat] = [:]      // stores offset for each element in array
        
        
        
    
    // MARK: - ViewController events
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }  // end viewDidLoad
    
    
        
    
    // MARK: - TableView DataSource methods
    
    /// Number of Sections in our TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Number of rows in Section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    

    /// Cell for each row within the TableView
    override func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    
        
    /// Function called before TableView cell is to be displayed
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
            switch indexPath.row {
                    case 0:
                        guard let tableViewCell = cell as? TwelfthA2TableViewCell1 else { return }
                        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
                        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
                    case 1:
                        print("case 1")
                    case 2:
                        print("case 2")
                        /*
                        guard let tableViewCell3 = cell as? TwelfthA2TableViewCell3 else { return }
                        tableViewCell3.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
                        tableViewCell3.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
                        */
                        
                    case 3:
                        print("case 3")

                    case 4:
                        print("case 4")

                    case 5:
                        print("case 5")

                    default:
                        print("case 1")
            } // end switch
    } // end func
    
        
    /// Function called before cell stops displaying
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell,  forRowAt indexPath: IndexPath) {
        
            switch indexPath.row {
                    case 0:
                        guard let tableViewCell = cell as? TwelfthA2TableViewCell1 else { return }
                        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
                    case 1:
                        print("case 11")
                    case 2:
                        print("case 22")
                
                    case 3:
                        print("case 33")
                        
                    case 4:
                        print("case 44")
                        
                    case 5:
                        print("case 55")
                        
                    default:
                        print("case 11")
            } // end switch
        
    } // end func
    
        
        
    /// Function determines the height of each cell within the TabelView
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat  {
        switch indexPath.row {
            case 0:
                return 120
            case 1:
                return 320
            case 2:
                return 180
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



















// MARK: - CollectionView DataSource Methods

/// Extension for TableViewController
extension TwelfthA2ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        
        //return model[collectionView.tag].count
        
        //return model[0].count
        
        return 8
    }
    
    
    
    
    
    
    /// Function give sus indivisula cell within Collection View
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch indexPath.row {
                case 0:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelfthA2CollectionView1Cell", for: indexPath)
                    cell.backgroundColor = model[collectionView.tag][indexPath.item]
                    return cell
                case 1:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelfthA2CollectionView1Cell", for: indexPath)
                    cell.backgroundColor = UIColor.brown
                    return cell
                case 2:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelfthA2CollectionView1Cell", for: indexPath)
                    cell.backgroundColor = UIColor.darkGray
                    return cell
                case 3:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelfthA2CollectionView1Cell", for: indexPath)
                    cell.backgroundColor = UIColor.green
                    return cell
                case 4:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelfthA2CollectionView1Cell", for: indexPath)
                    cell.backgroundColor = UIColor.cyan
                    return cell
                case 5:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelfthA2CollectionView1Cell", for: indexPath)
                    cell.backgroundColor = UIColor.orange
                    return cell
                default:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelfthA2CollectionView1Cell", for: indexPath)
                    cell.backgroundColor = model[collectionView.tag][indexPath.item]
                    return cell
        }

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
    
    

    
    
}  // end extension
