

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
import PINRemoteImage
import PINCache
import AlamofireImage
import SwiftyJSON


public class NinthViewController: UICollectionViewController,  JsonConvertible {
    
    // MARK: - IBOutlets
    @IBOutlet var photoCollectionView: UICollectionView!
  
    // MARK: - Local Variables
    var city:String!
    var sectionPhotoDictionary:[String:[NinthPhoto]] = [:]
  
  /*
    // MARK: - Global Constants Variables
    let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
    let apiKey = Constants.Configuration.apiKey
    let method = Constants.Configuration.method
    let key  = Constants.Configuration.key
    let rootPath = Constants.Configuration.rootPath
    let dataKey = Constants.Configuration.dataKey
    let params = Constants.Configuration.params
  
  
  */
  
  
  
  
  
  
  
  
  
  
  
    // MARK:- Data Variables
    /// These are populated during segue by the 'prepareForSegue' method  ( in FirstViewController.swift )
    var store: NinthPhotoStore!
    var photoDataSource: NinthPhotoCollectionViewDataSource!
  
  
    // MARK:- Enums
    enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
    }

  
    // MARK: - ViewController Methods
    
    override public func viewDidLoad() {
        
        /// NOTE: We populate data variables in our PhotoDataSource in the closure below
        
        super.viewDidLoad()
        photoCollectionView.dataSource = photoDataSource
        photoCollectionView.delegate = self
      
        // get details for web site used for testing
        // Get access to test site details for Row #2
        guard let testSite = Constants.Configuration.TestSite(rawValue: "FLICKR") else {
          return
        }
        
      
        // Completion Handler
        let completionHandler: (Result<JSON>) -> Void  =
            {  [weak self] result in
              
                guard let strongSelf = self else {
                  return
                }
               
               
                             
                let jsonObj = result.value!
               
               
               
               
               
               
               // get list of Photos(returns array of 'NinthPhoto' items)
                let itemsResult: NinthPhotoStore.NinthPhotosResult   = strongSelf.store.photosFromJsonObject(jsonObj)
               
               
               
               
               
               
                // get array of Section titles
                guard let photoKeyArray =  strongSelf.getSectionTitlesArray(from: jsonObj, key: testSite.key)   else {
                    //print("getKeyArray method returned a nil value.")
                    return
                }
                /*
                print("+++++++++++++++++  Section Titles Array  +++++++++++++++++++++++")
                print(photoKeyArray)
                print("+++++++++++++++++  end Section Titles +++++++++++++++++++++")
                */
                
                // get Section Title: Photos Dictionary
                  guard let sectionPhotosDictionary = strongSelf.store.sectionPhotosDictionary(from: jsonObj, for: testSite.key) else {
                      print("Section Photo Items Dictionary is nil")
                      return
                }
              
                print("+++++++++++++++++  Section Photos Dictonary +++++++++++++++++++++++")
                print(sectionPhotosDictionary)
 
                OperationQueue.main.addOperation() {
                    switch itemsResult {
                        case let .success(photos):
                            print(" We have total of \(photos.count)  photos ")
                            // Send values over to DataSource class (NinthPhotoCollectionViewDataSource.swift)
                            strongSelf.photoDataSource.photos = photos
                            strongSelf.photoDataSource.sections =  photoKeyArray
                            strongSelf.photoDataSource.sectionPhotoItems = sectionPhotosDictionary  // populate the Items Dictionary
                        case .failure(let error):
                            strongSelf.photoDataSource.photos.removeAll()
                            print("     Error fetching recent photos \(error)")
                    }  // end switch
                
                    // Reload Data
                    strongSelf.photoCollectionView?.reloadData()
                }  // end operation
                
                
        } // end closure
  
      
      guard let url = getSiteURL(baseURLString: testSite.urlString, method: testSite.method, parameters: testSite.params, apiKey: testSite.apiKey) else {
        return
      }
      
      getJSONObject(for: url, rootPath: testSite.rootPath, completionHandler: completionHandler)  // get a SwiftyJSON object
      
    }  // end viewDidLoad
    
    
  
  /// Function called during the segue from NinthViewController to Detail View Controller

  override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowNinthPhotoDetail" {
      let destinationVC = segue.destination as! NinthDetailViewController
      if let selectedIndexPath = photoCollectionView?.indexPathsForSelectedItems?.first {
        updateDestinationData(destinationVC: destinationVC, indexPath: selectedIndexPath)
      }
    } // if segue
  }
  
  /// Function updates photo in Detail screen
  func updateDestinationData(destinationVC: NinthDetailViewController, indexPath: IndexPath) {
    let photo = photoDataSource.photoForItemAtIndexPath(indexPath: indexPath)
    destinationVC.photo = photo
    destinationVC.store = store
  }
  

  
}  // end class





    // MARK: - CollectionView


extension NinthViewController:  NinthPhotoCollectionViewCellDelegate  {
  
  
  /*
  
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
    
    */
  
  
  
  
  
  
  
    
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

