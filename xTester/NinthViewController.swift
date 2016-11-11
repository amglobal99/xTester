

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
    
    var store: NinthPhotoStore!
    let photoDataSource = NinthPhotoCollectionViewDataSource()
    var jsonResultObject:JSON?
    var city:String!
    let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
    let APIKey = "a6d819499131071f158fd740860a5a88"
    let method = "flickr.photos.getRecent"
    
    fileprivate static let dateFormatter: DateFormatter = {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    
    enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCollectionView.dataSource = photoDataSource
        photoCollectionView.delegate = self
        
        let completionHandler: (Result<JSON>) -> Void  =
            {  result in
                print("NinthViewController: Executing completeon handler after getJSONObject" )
                let jsonObj = result.value!
                let itemsResult: NinthPhotoStore.NinthPhotosResult   = self.store.photosFromJsonObject(jsonObj)
                OperationQueue.main.addOperation() {
                    switch itemsResult {
                        case let .success(photos):
                            self.photoDataSource.photos = photos
                        case .failure(let error):
                            self.photoDataSource.photos.removeAll()
                            print("     Error fetching recent photos \(error)")
                    }  // end switch
                    
                    self.photoCollectionView?.reloadSections(IndexSet(integer: 0) ) // WHAT IS THIS  ?????
                
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
        //print("                   willDisplayCell ......Starting")
        let photo = photoDataSource.photos[(indexPath as NSIndexPath).row]
        
        store.fetchImageForPhoto(photo)
            {    (result) -> Void in
                    print("                fetchImageForPhoto -  starting closure")
                    OperationQueue.main.addOperation() {
                        print("      Operation starting....")
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
    

    
    
    
    
}  // end class

