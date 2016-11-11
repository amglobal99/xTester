//
//  NinthC`ollectionViewLayout.swift
//  xTester
//
//  Created by Dad on 10/8/16.
//  Copyright © 2016 Natsys. All rights reserved.
//



import Foundation
import UIKit


class NinthPhotoCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    
    
    /*
    
    // hold the index path of the item being inserted
    var appearingIndexPath: IndexPath?
    
    // holde the index paths of the items being deleted
    var disappearingIndexPaths: [IndexPath]?
    
    
    // this method provies the layout with the initial layout attributes for items being inserted into the collection view
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        // a set of layout attributes for the item at the given index path
        // these are the default attributes
        let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath)
        
        // we will manipulate them if the index path matches the index path of the item being inserted
        if let indexPath = appearingIndexPath { // unwrap the appearing index path
            if let attributes = attributes {    // the super method returns optional so also upwraps
                if indexPath == itemIndexPath { // check if the current indexpath is the same as the one inserted
                    
                    // update the item position, scale..
                    attributes.alpha = 1.0
                    //                    attributes.center = CGPoint(x: CGRectGetWidth(collectionView!.frame) - 23.5, y: -24.5)
                    
                    attributes.transform = CGAffineTransform(scaleX: 0.15, y: 0.15)
                    attributes.zIndex = 99  // make this item appear above all other items
                }
            }
        }
        
        return attributes   // next, we need to tell our collection view to use the collection view flow layout
    }
    
    
    
    
    // change the final state of the deleted items' attributes
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath)
        
        if let disappearingIndexPaths = disappearingIndexPaths {
            for indexPath in disappearingIndexPaths {
                if indexPath == itemIndexPath {
                    if let attributes = attributes {
                        
                        attributes.alpha = 0.0
                        attributes.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                        attributes.zIndex = -1
                        
                    }
                }
            }
        }
        
        return attributes
    }
    
    
    */
    
    
    
   
    
    
    
    
    
}   // end class
