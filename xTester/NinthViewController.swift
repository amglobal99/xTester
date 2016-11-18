

//
//  NinthViewController.swift

// *****************************************************************************************
//
//  This is the View Controller that displays our collection of Photos from Flickr web site.
//  We store our results as an array of 'NinthPhoto' objects.
//  We also create an array of our section Labels. For example, my section labels are ["Technology","sports","music"]
//  We then use these two arrays to get information such as
//      1. How many Sections ?
//      2. How many Items in a particular section ?
//      3. Section Title
//  
//  Supporting file for this Controller is NinthPhotoCollectionViewDataSource.swift
//
// ******************************************************************************************



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
    
    var city:String!
    var sectionPhotoDictionary:[String:[NinthPhoto]] = [:]
    
    
    //  Get global constants values
    let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
    let apiKey = Constants.Configuration.apiKey
    let method = Constants.Configuration.method
    let key  = Constants.Configuration.key
    let rootPath = Constants.Configuration.rootPath
    let dataKey = Constants.Configuration.dataKey
    let params = Constants.Configuration.params
    
    
    // ******************************** Data variables *********************
    // These are populated during segue by the 'prepareForSegue' method  ( in FirstViewController.swift )
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
                
                // get list of Photos (returns array of 'NinthPhoto' items)
                let itemsResult: NinthPhotoStore.NinthPhotosResult   = (self?.store.photosFromJsonObject(jsonObj))!
                
                // get array of Section titles
                guard let photoKeyArray =  self?.getKeyArray(from: jsonObj, key: self?.key)   else {
                    print("getKeyArray method returned a nil value.")
                    return
                }
                print("+++++++++++++++++  Section Titles Array  +++++++++++++++++++++++")
                print(photoKeyArray)
                print("+++++++++++++++++  end Section Titles +++++++++++++++++++++")
                
                
                
                // get Dictionary
                guard let photoItemsDictionary = self?.getDictionary(from: jsonObj,  for: self?.key, keyArray: photoKeyArray, dataKey:self?.dataKey)
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
                            
                            print(" We have total of \(photos.count)  photos ")
                           
                            
                            // ====== Send values over to DataSource class (NinthPhotoCollectionViewDataSource.swift) =========
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
        
        
        
        // Create a Async (Alamofire) request to get jSON data
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: apiKey)
        getJSONObject(for: url, rootPath: rootPath, completionHandler: completionHandler)  // get a SwiftyJSON object
        
        
    }  // end viewDidLoad
    
    

    
    
        
    
    
    // Collection View .....WillDisplayCell
    //
    override func collectionView (_ collectionView: UICollectionView,  willDisplay cell: UICollectionViewCell,  forItemAt indexPath: IndexPath )  {
        // print("                   willDisplayCell ......Starting")
        
        
        
        /*
        
        let rowNumber = (indexPath as IndexPath).row
        let sectionNumber = (indexPath as IndexPath).section
        print( " willDisplayCell  Row is : \(rowNumber) and Section is: \(sectionNumber) ")
        
        // Get photos for this section (Filter the photos array)
        let sectionPhotos = photoDataSource.photos.filter{
            $0.datetakenUnknown == String(sectionNumber)
        }
        
        // get the Photo to process
        let photo = sectionPhotos[rowNumber]
         
         
         
         
         
         
         //let photo = photoDataSource.photos[(indexPath as IndexPath).row]
         
         

        
*/
        
        
        
        
        
        
        
        
        
        let photo = photoDataSource.photoForItemAtIndexPath(indexPath: indexPath)
        
        
        
        
        
        
        
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Show Detail Screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Starting prepareForSegue")
        if segue.identifier == "ShowNinthPhotoDetail" {
            print("Id matches ....")
            
            
            /*
            
            
           if let selectedIndexPath = photoCollectionView?.indexPathsForSelectedItems?.first {
                print("index is correct...")
            
            
            let rowNumber = (selectedIndexPath as IndexPath).row
            let sectionNumber = (selectedIndexPath as IndexPath).section
            print( " segue Row is : \(rowNumber) and Section is: \(sectionNumber) ")
            
            // Get photos for this section (Filter the photos array)
            let sectionPhotos = photoDataSource.photos.filter{
                $0.datetakenUnknown == String(sectionNumber)
            }
            
            // get the Photo to process
            let photo = sectionPhotos[rowNumber]
            
            
            
           
            
            
            
              //  let photo = photoDataSource.photos[(selectedIndexPath as IndexPath).row]
            
            */
            
            
            
            
            if let selectedIndexPath = photoCollectionView?.indexPathsForSelectedItems?.first {
            
                     let photo = photoDataSource.photoForItemAtIndexPath(indexPath: selectedIndexPath)
                
                    let destinationVC = segue.destination as! NinthDetailViewController
                    print("destination VC is ok .......")
                
                        destinationVC.photo = photo
                        destinationVC.store = store
                    
                  // ===== Remove AFTER TESTING
                    destinationVC.city = "Kennesaw"
            
            } // if let selectedIndexPath
            
        
        
        
        
        
        
        
        
        } // if segue.identifier
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

