//
//  TwelfthA2ViewController.swift
//  xTester
//
//  Created by Dad on 11/10/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import Foundation
import UIKit

class TwelfthA2ViewController: UITableViewController,  Utils {
    
    
    let model: [[UIColor]] = generateRandomData()
    var storedOffsets = [Int: CGFloat]()
    
    
    
    // MARK: - ViewController events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    // MARK: - TableView DataSource methods
    
    /// Number of Sections in our TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    /// Number of rows in Section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows in section: \(section) : 6")
        return 6
    }
    
    
    
    
    /// Cell for each row
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
    
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 {
            guard let tableViewCell = cell as? TwelfthA2TableViewCell1 else { return }
            tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        }
        
        
       
    }
    
    
    override func tableView(_ tableView: UITableView,
                            didEndDisplaying cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        
          if indexPath.row == 0 {

            guard let tableViewCell = cell as? TwelfthA2TableViewCell1 else { return }
            storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        
        }
        
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat  {
        
        switch indexPath.row {
            case 0:
                return 120
            case 1:
                return 320
            case 2:
                return 160
            case 3:
                return 340
            case 4:
                return 120
            case 5:
                return 220
            default:
                return 200
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}  // end class



















// MARK: - CollectionView DataSource Methods


extension TwelfthA2ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        return model[collectionView.tag].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelfthA2CollectionView1Cell", for: indexPath)
        cell.backgroundColor = model[collectionView.tag][indexPath.item]
        return cell
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
