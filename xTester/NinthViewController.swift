

//
//  NinthViewController.swift

import UIKit
import Alamofire
import PINCache
import BRYXBanner
import Locksmith
import PINRemoteImage
import AlamofireImage
import SwiftyJSON


class NinthViewController: UICollectionViewController, NinthPhotoCollectionViewCellDelegate, Utils, JsonConvertible {
    
    
    @IBOutlet var photoCollectionView: UICollectionView!
    
    
   // var jsonResultObject:JSON?
    var city:String!
    var sectionPhotoDictionary:[String:[NinthPhoto]] = [:]
    
    
    
    //  Get global constants values
    let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
    let APIKey = Constants.FlickrApi.APIKey
    let method = Constants.FlickrApi.method
    let key  = Constants.FlickrApi.key
    let rootPath = Constants.FlickrApi.rootPath
    let dataKey = Constants.FlickrApi.dataKey
    let params = Constants.FlickrApi.params
    
    
    
    
    // ****** Data variables *********************
    var store: NinthPhotoStore!
    var photoDataSource: NinthPhotoCollectionViewDataSource!
    
    
    enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
    }

    
    
    // Note how we populate Data variables in this section
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        photoCollectionView.dataSource = photoDataSource
        photoCollectionView.delegate = self
      
        // ********************** This is our Completion Handler **********************************
        let completionHandler: (Result<JSON>) -> Void  =
            {  [weak self] result in
                let jsonObj = result.value!
                
                // get list of Photos  ( contains 'NinthPhoto' items )
                let itemsResult: NinthPhotoStore.NinthPhotosResult   = (self?.store.photosFromJsonObject(jsonObj))!
                
                
                // ======= lets' get some arrays and Dictionaryies from our JSON  ==========
                
                // get key array
                guard let photoKeyArray =  self?.getKeyArray(from: jsonObj, key: self?.key)   else {
                    print("keyArray was null ...")
                    return
                }
                print("+++++++++++++++++  Key Array ---> key is \"datetakenunknown\" +++++++++++++++++++++++")
                print(photoKeyArray)
                print("+++++++++++++++++  end Dictionary +++++++++++++++++++++")
                
                 
                 
                 
                 
                 /*
                // get Dictionary
                guard let photoItemsDictionary = self?.getDictionary(from: jsonObj,  for: self?.key, keyArray: photoKeyArray, dataKey:self?.dataKey)
                else {
                    print("Photo tems Dictionary is nil")
                    return
                }
                
                print("+++++++++++++++++  Dictonary +++++++++++++++++++++++")
                print(photoItemsDictionary)
                print("+++++++++++++++++  end Dictionary +++++++++++++++++++++")
                
                */
                
                
                
                
                // get Dictionary of Photo objects
                
                // get Dictionary
                guard let photoItemsDictionary = self?.getDictionary(from: jsonObj,  for: self?.key, keyArray: photoKeyArray, dataKey:self?.dataKey)
               // guard let photoItemsDictionary = self?.getDictionaryOfItems(from: jsonObj,  for: self?.key, keyArray: photoKeyArray, dataKey:self?.dataKey)
                    else {
                        print("Photo tems Dictionary is nil")
                        return
                }
            
                print("+++++++++++++++++  Dictonary +++++++++++++++++++++++")
                print(photoItemsDictionary)
                print("+++++++++++++++++  end Dictionary +++++++++++++++++++++")
         
                
                OperationQueue.main.addOperation() {
                    switch itemsResult {
                        case let .success(photos):
                            
                            
                            
                            /*
                            // Let's create a Dictionary for Photos 
                            for section in photoKeyArray {
                                let sectionPhotos:[NinthPhoto] = photos.filter {
                                    (photo) -> Bool in
                                    return  == section
                                    publisher.section == section
                                    
                                }
                                sectionPhotoDictionary.updateValue(sectionPhotos, forKey: section)
                                
                                
                                
                            }
                            
                            
                            */
                            
                            
                            print(" We have total of \(photos.count)  photos ")
                           
                            
                            // ====== Let's send the data over to our Data Source class =========
                            self?.photoDataSource.photos = photos
                            self?.photoDataSource.sections =  photoKeyArray
                           //self?.photoDataSource.sectionItems = photoItemsDictionary  // populate the Items Dictionary
                        
                        case .failure(let error):
                            self?.photoDataSource.photos.removeAll()
                            print("     Error fetching recent photos \(error)")
                    }  // end switch
                
                    // ************* RELOAD *************************************************
                        //self?.photoCollectionView?.reloadSections(IndexSet(integer: 0) ) // WHAT IS THIS  ?????
                        self?.photoCollectionView?.reloadData()
                    // *********************************************************************
                }  // end operation
                
                
                
        } // end closure
  
        // ************************************* end Clsoure  ***********************************************
        
        
        // ====== Create a Async request to get jSON data =============================================================
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: APIKey)
        getJSONObject(for: url, rootPath: rootPath, completionHandler: completionHandler)  // get a SwiftyJSON object
        
        
    }  // end viewDidLoad
    
    

    
    
        
    
    
    // ======== Collection View ..... WILL DISPLAY CELL   ============
    //
    override func collectionView (_ collectionView: UICollectionView,  willDisplay cell: UICollectionViewCell,  forItemAt indexPath: IndexPath )  {
        // print("                   willDisplayCell ......Starting")
        let photo = photoDataSource.photos[(indexPath as NSIndexPath).row]
        
        store.fetchImageForPhoto(photo)
            {    (result) -> Void in
                    OperationQueue.main.addOperation() {
                        let photoIndex = self.photoDataSource.photos.index(of: photo)!
                        let photoIndexPath = IndexPath(row: photoIndex, section: 0)
                        if let cell = self.photoCollectionView?.cellForItem(at: photoIndexPath) as? NinthPhotoCollectionViewCell {
                            cell.updateWithImage(photo.image)
                        }
                    } //end operation
            } // end closure

    } //end method
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Starting prepareForSegue")
        if segue.identifier == "ShowNinthPhotoDetail" {
            
            print("Id matches ....")
            
           if let selectedIndexPath = photoCollectionView?.indexPathsForSelectedItems?.first {
                
                
                print("index is correct...")
                
                
                let photo = photoDataSource.photos[(selectedIndexPath as NSIndexPath).row]
                let destinationVC = segue.destination as! NinthDetailViewController
            
            
            
                
                print("destination VC is ok .......")
                
                
                    destinationVC.photo = photo
                    destinationVC.store = store
                
              // ===== Remove AFTER TESTING
                destinationVC.city = "Kennesaw"
                
                
                
            } //end if
            
            
            
            
            
        } //end if
    } //end method
    

    
    
    /*
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let size = CGSize(width: 300, height: 300)
        return size
        
        //return CGSizeMake(320, 350)
        
    }
    
    
    */
    
    
    
    
    
    
    
    
    
}  // end class

