//
//  TwelfthA2CollectionView2.swift
//  xTester
//
//  Created by Dad on 11/24/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import UIKit
import Alamofire
import PINCache
import BRYXBanner
import Locksmith
import PINRemoteImage
import AlamofireImage
import SwiftyJSON





class TwelfthA2CollectionView3: UICollectionView, TwelfthA2CollectionView3CellDelegate, Utils, JsonConvertible {
    
    
    
    
    
    /*
    
    // MARK: - IBOutlets
    @IBOutlet var photoCollectionView: UICollectionView!
    
    
    // MARK: - Local Variables
    var city:String!
    var sectionPhotoDictionary:[String:[NinthPhoto]] = [:]
    
    // MARK: - Global Constants Variables
    let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
    let apiKey = Constants.Configuration.apiKey
    let method = Constants.Configuration.method
    let key  = Constants.Configuration.key
    let rootPath = Constants.Configuration.rootPath
    let dataKey = Constants.Configuration.dataKey
    let params = Constants.Configuration.params
    
    
    // MARK:- Data Variables
    /// These are populated during segue by the 'prepareForSegue' method  ( in FirstViewController.swift )
    var store: TwelfthA2CollectionView3PhotoStore!
    var photoDataSource: TwelfthA2CollectionView3DataSource!
    
    
    
    // MARK:- Enums
    enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
    }
    
    
    
    
    
    // MARK: - CollectionView Methods
    
    /**
     Function executed as Cell is getting ready to be displayed
     
     */
    
    override public func collectionView (_ collectionView: UICollectionView,
                                         willDisplay cell: UICollectionViewCell,
                                         forItemAt indexPath: IndexPath )  {
        
        let photo = photoDataSource.photoForItemAtIndexPath(indexPath: indexPath)
        store.fetchImageForPhoto(photo)
        {    (result) -> Void in
            OperationQueue.main.addOperation() {
                // get Dictionary for photo items
                let sectionDict = self.photoDataSource.sectionPhotoItems
                guard let path = self.store.indexForPhoto(dict: sectionDict, photo: photo)  else {
                    return
                }
                let photoRow = path.0
                let photoSection = path.1
                let photoIndexPath = IndexPath(row: photoRow , section: photoSection)
                // print("Indexpath (willDisplayCell) :   Section: \(photoSection!)   Row: \(photoRow!)")
                if let cell = self.photoCollectionView?.cellForItem(at: photoIndexPath) as? NinthPhotoCollectionViewCell {
                    cell.updateWithImage(photo.image)     // Update cell photo
                }
            } //end operation
        } // end closure
        
    } //end method
    
    
    
    
    
    
    /**
     Function called during the segue from NinthViewController to Detail View Controller
     */
    
    
     override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTwelfthA2PhotoDetail" {
            let destinationVC = segue.destination as! TwelfthA2DetailViewController
            if let selectedIndexPath = photoCollectionView?.indexPathsForSelectedItems?.first {
                updateDestinationData(destinationVC: destinationVC, indexPath: selectedIndexPath)
            }
        } // if segue
    }
    
    
    
    
    
    func updateDestinationData(destinationVC: TwelfthA2DetailViewController, indexPath: IndexPath) {
        //let photo = photoDataSource.photoForItemAtIndexPath(indexPath: indexPath)
        //destinationVC.photo = photo
        //destinationVC.store = store
    }
    
    
 
    */
    
    
    
    
} // end class


