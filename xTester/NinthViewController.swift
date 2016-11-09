

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
    //var store = NinthPhotoStore()
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
        
        print("NinthViewController: Starting viewDidLoad")
        super.viewDidLoad()
        photoCollectionView.dataSource = photoDataSource
        photoCollectionView.delegate = self
        
        let completionHandler: (Result<JSON>) -> Void  =
                { [weak self] result in
                        print("NinthViewController: Executing completeon handler after getJSONObject" )
                        let jsonObj = result.value!
                        let itemsResult  = self?.store.photosFromJsonObject(jsonObj)
                        OperationQueue.main.addOperation() {
                            switch itemsResult! {
                                case let .success(photos):
                                    self?.photoDataSource.photos = photos
                                    print("photos set")
                                case .failure(let error):
                                    self?.photoDataSource.photos.removeAll()
                                    print("     Error fetching recent photos \(error)")
                                }  // end switch
                        }  // end operation
                } // end closure
        
        // This is where we will play with our Asynchronous Requests
        let params = ["extras":"url_h,date_taken"]
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: APIKey)
        print("NInthViewController: calling getJSONObject ")
        getJSONObject(for: url, rootPath: ["photos","photo"], completionHandler: completionHandler)  // get a SwiftyJSON object
        print("NInthViewController: finished viewDidLoad")
        
    }  // end viewDidLoad
    
    

    
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func collectionView (_ collectionView: UICollectionView,  willDisplay cell: UICollectionViewCell,  forItemAt indexPath: IndexPath )  {
        
        print("collView willDisplayCell ..")
        
        
        /*
        let photo = photoDataSource.photos[(indexPath as NSIndexPath).row]
        
        
        store.fetchImageForPhoto(photo) {  //begin closure
            (result) -> Void in
            OperationQueue.main.addOperation() {
                let photoIndex = self.photoDataSource.photos.index(of: photo)!
                let photoIndexPath = IndexPath(row: photoIndex, section: 0)
                if let cell = self.collectionView?.cellForItem(at: photoIndexPath) as? NinthPhotoCollectionViewCell {
                    cell.updateWithImage(photo.image)
                }  // end if
            } //end operation
        } // end closure
        
        */
        
        
        
        let photo = photoDataSource.photos[(indexPath as NSIndexPath).row]
        store.fetchImageForPhoto(photo) {  //begin closure
            (result) -> Void in
            
            print("starting closure .... for fetchImageForPhotot")
            
            
            
            OperationQueue.main.addOperation() {
                let photoIndex = self.photoDataSource.photos.index(of: photo)!
                let photoIndexPath = IndexPath(row: photoIndex, section: 0)
                if let cell = self.collectionView?.cellForItem(at: photoIndexPath) as? NinthPhotoCollectionViewCell {
                    cell.updateWithImage(photo.image)
                }  // end if
            } //end operation
        } // end closure

        
        
        
        
        
        
        
        
        
    } //end method
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhoto" {
            if let selectedIndexPath = collectionView?.indexPathsForSelectedItems?.first {
                let photo = photoDataSource.photos[(selectedIndexPath as NSIndexPath).row]
                let destinationVC = segue.destination as! NinthDetailViewController
                //destinationVC.photo = photo
                //destinationVC.store = store
            } //end if
        } //end if
    } //end method
    

    
    
    
    
    
    
    
    
    
    
    
    
 
 
 
 
 
    
}  // end class

