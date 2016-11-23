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
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("nUmber of sections")
        return model.count
    }
    
    override func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        print("cell for row at \(indexPath.row) ")
        
        
        
        
        switch indexPath.row {
            
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell1", for: indexPath)
                return cell
            case 1:
                print("Section is : \(indexPath.row)  and row : \(indexPath.section)   ")
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell2", for: indexPath)
                cell.backgroundColor = UIColor.blue
                return cell
            case 2:
                print("Section is : \(indexPath.row)  and row : \(indexPath.section)   ")

                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell3", for: indexPath)
                return cell
            case 3:
                print("Section is : \(indexPath.row)  and row : \(indexPath.section)   ")

                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell4", for: indexPath)
                return cell
            case 4:
                print("Section is : \(indexPath.row)  and row : \(indexPath.section)   ")

                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell5", for: indexPath)
                return cell
            case 5:
                print("Section is : \(indexPath.row)  and row : \(indexPath.section)   ")

                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell6", for: indexPath)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwelfthA2TableViewCell1", for: indexPath)
                return cell
        
        } // end switch
        
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 {
        guard let tableViewCell = cell as? TwelfthA2PhotoTableViewCell1 else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        
        
        }
        
        
       
    }
    
    
    override func tableView(_ tableView: UITableView,
                            didEndDisplaying cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        
          if indexPath.row == 0 {

            guard let tableViewCell = cell as? TwelfthA2PhotoTableViewCell1 else { return }
            storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        
        }
        
        
    }
    
    
}  // end class









// MARK: - CollectionView DataSource Methods


extension TwelfthA2ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        return model[collectionView.tag].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelfthA2CollectionViewCell1", for: indexPath)
        cell.backgroundColor = model[collectionView.tag][indexPath.item]
        return cell
    }
    
    
}  // end extension
