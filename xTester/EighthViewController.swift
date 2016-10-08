//
//  EighthViewController.swift
//  xTester
//
//  Created by Dad on 10/8/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


    
    import Foundation
    import UIKit
    
    class EighthViewController: UICollectionViewController {
        
        
        
        @IBOutlet weak var headerLabel: UILabel!
        
        let reuseIdentifier = "cell"
        var items = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"]
        var sections = ["Pune","Atlanta","Dallas"]
        
        
        // MARK: - UICOllectionViewDataSource protool
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.items.count
            
            //return 2
            
        }
        
        
        
        // make a cell for each cell index path
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EighthCollectionViewCell
            //cell.jackLabel.text = self.items[indexPath.item]
            
            cell.testLabel.text = self.items[(indexPath as NSIndexPath).item]
            
            cell.backgroundColor = UIColor.yellow
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            return cell
        }
        
        
        /*
         override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
         
         
         
         let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", forIndexPath: indexPath) as! UICollectionReusableView
         
         header.headerLabel.text = "YOUR_HEADER_TEXT"
         
         return header
         
         
         
         
         
         
         }
         */
        
        
        
        // MARK: - UICollectionViewDelegate protocol
        
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("you selected a Cell ...")
        }
        
        // change background color when user touches cell
        override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
            print("you Highlightedd a cell")
            
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.backgroundColor = UIColor.red
        }
        
        // change background color back when user releases touch
        override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.backgroundColor = UIColor.yellow
        }
        
        

        
        
        
        
        
        
    }   // end class
    

    
    

