

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
    
    
        var jsonResultObject:JSON?
    var city:String!
    let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
    let APIKey = "a6d819499131071f158fd740860a5a88"
    let method = "flickr.photos.getRecent"
    
    
    // ****** Data variables *********************
    var store: NinthPhotoStore!
    var photoDataSource: NinthPhotoCollectionViewDataSource!

    
    
    
    fileprivate static let dateFormatter: DateFormatter = {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    
    enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
    }

    
    
    
    
    
    
    
    
    // Note how we populate Data variables in this section
    
    override func viewDidLoad() {
        
        
        print(" viewDidLoad.....Start")
        
        super.viewDidLoad()
        photoCollectionView.dataSource = photoDataSource
        photoCollectionView.delegate = self
        
        
        
        let completionHandler: (Result<JSON>) -> Void  =
            {  [weak self] result in
                //  print("NinthViewController: Executing completeon handler after getJSONObject" )
                let jsonObj = result.value!
                let itemsResult: NinthPhotoStore.NinthPhotosResult   = (self?.store.photosFromJsonObject(jsonObj))!
                
                
                // ======= lets' get some arrays and Dictionaryies from our JSON  ==========
                
                // get key array
                guard let photoKeyArray =  self?.getKeyArray(from: jsonObj, key: "server")   else {
                    print("keyArray was null ...")
                    return
                }
                
                print("+++++++++++++++++  Key Array ---> key is \"server\" +++++++++++++++++++++++")
                print(photoKeyArray)
                print("+++++++++++++++++  end Dictionary +++++++++++++++++++++")
                
                // get Dictionary
                guard let photoItemsDictionary = self?.getDictionary(from: jsonObj,  for: "server", keyArray: photoKeyArray, dataKey:"id") else {
                    //    guard let myDict = getDictionary(from: obj,  for: "server", keyArray: myKeyArray, dataKey:"id") else {
                    print("myDict was null..")
                    return
                }
                
                
                print("+++++++++++++++++  Dictonary +++++++++++++++++++++++")
                print(photoItemsDictionary)
                print("+++++++++++++++++  end Dictionary +++++++++++++++++++++")
                
                
                
                
                /*
                var srvId = photoKeyArray[2]
 
                
               // guard let dictValues = self?.getDictionaryValues(fromDictionary: myDict, for: "5672") else {
                    guard let dictValues = self?.getDictionaryValues(fromDictionary: photoItemsDictionary, for: srvId) else {
                        
                        
                    print("dictValues ws null....")
                    return
                }
 
                
                
                print(" ########  Values from Dict for item 5522 ##########")
                print(dictValues)
                print("####################  end Dict values ############")
                
                
                */
                
                
                
                
                OperationQueue.main.addOperation() {
                    switch itemsResult {
                        case let .success(photos):
                            // ====== Let's send the data over to our Data Source class =========
                            self?.photoDataSource.photos = photos
                            self?.photoDataSource.itemsDictionary  = photoItemsDictionary  // populate the Items Dictionary
                            self?.photoDataSource.itemsKeyArray = photoKeyArray   // populate key array
                        case .failure(let error):
                            self?.photoDataSource.photos.removeAll()
                            print("     Error fetching recent photos \(error)")
                    }  // end switch
                    
                    
                    // ************* RELOAD *************************************************
                    
                    //self?.photoCollectionView?.reloadSections(IndexSet(integer: 0) ) // WHAT IS THIS  ?????
                    print("Let's see if data is present ")
                    self?.photoCollectionView?.reloadData()
                    
                    // *********************************************************************
                    
                
                }  // end operation
                
                
                
        } // end closure
        
  
        // This is where we will play with our Asynchronous Requests
        let params = ["extras":"url_h,date_taken"]
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: APIKey)
        getJSONObject(for: url, rootPath: ["photos","photo"], completionHandler: completionHandler)  // get a SwiftyJSON object
        
    }  // end viewDidLoad
    
    

    
    
        
    
    
    // ======== Collection View ..... WILL DISPLAY CELL   ============
    //
    override func collectionView (_ collectionView: UICollectionView,  willDisplay cell: UICollectionViewCell,  forItemAt indexPath: IndexPath )  {
        // print("                   willDisplayCell ......Starting")
        let photo = photoDataSource.photos[(indexPath as NSIndexPath).row]
        
        store.fetchImageForPhoto(photo)
            {    (result) -> Void in
                   // print("                fetchImageForPhoto -  starting closure")
                    OperationQueue.main.addOperation() {
                        //print("      Operation starting....")
                        let photoIndex = self.photoDataSource.photos.index(of: photo)!
                        let photoIndexPath = IndexPath(row: photoIndex, section: 0)
                        if let cell = self.photoCollectionView?.cellForItem(at: photoIndexPath) as? NinthPhotoCollectionViewCell {
                            cell.updateWithImage(photo.image)
                        }  // end if
                    } //end operation
            } // end closure

    } //end method
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowNinthPhotoDetail" {
            if let selectedIndexPath = photoCollectionView?.indexPathsForSelectedItems?.first {
                let photo = photoDataSource.photos[(selectedIndexPath as NSIndexPath).row]
                let destinationVC = segue.destination as! NinthDetailViewController
                destinationVC.photo = photo
                destinationVC.store = store
            } //end if
        } //end if
    } //end method
    

    
    
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var size = CGSize(width: 300, height: 300)
        return size
        
        //return CGSizeMake(320, 350)
        
    }
    
    
    
    
    
    
    
    
}  // end class

