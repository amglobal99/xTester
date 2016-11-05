

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
    
    var jsonResultObject:JSON?
    var store: NinthPhotoStore!

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
        
        // This is where we will play with our Asynchronous Requests
        let params = ["extras":"url_h,date_taken"]
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: APIKey)  // Flickr
                
        print("got url ....")
        
        
        // ********  This is where the action happens **********************************
        let completionHandler: (Result<JSON>) -> Void  =
            { result in
                self.jsonResultObject = result.value!
                print("========= Items List ++++++++ ")
                if let jsObj = self.jsonResultObject {
                    print(jsObj)
                }
        } // end closure
        
        //  Call the generic method to get a SwiftyJSON object
        getJSONObject(for: url, rootPath: ["photos","photo"], completionHandler: completionHandler)  // Flickr
        print("finished viewDidLoad")
        
    }  // end viewDidLoad
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        /*
    
        @IBOutlet weak var addButton: UIBarButtonItem!
        
        
        @IBAction func dismissVC(_ sender: AnyObject) {
            print("dismissing.....")
            // self.dismiss(animated: true, completion: nil )
            _ = self.navigationController?.popViewController(animated: true)
            
            
        }
    
        // data source
        let publishers = Publishers()
        
        
        
        
        
        fileprivate let leftAndRightPaddings: CGFloat = 32.0
        fileprivate let numberOfItemsPerRow: CGFloat = 3.0
        fileprivate let heigthAdjustment: CGFloat = 30.0
        
        
        
        
        // MARK: - View controller life cycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let width = (collectionView!.frame.width - leftAndRightPaddings) / numberOfItemsPerRow
            let layout = collectionViewLayout as! UICollectionViewFlowLayout
            layout.itemSize = CGSize(width: width, height: width + heigthAdjustment)
            
            navigationItem.leftBarButtonItem = editButtonItem
            
            // add a long press gesture to move the cell around
            // let longPressGestureRecognizer = UILongPressGestureRecognizer(target:  self, action: "longPress:")
            
            let longPressGestureRecognizer = UILongPressGestureRecognizer(target:  self, action: #selector(longPress)  )
            
            
            collectionView?.addGestureRecognizer(longPressGestureRecognizer)
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // MARK: - Delete Items
        
        override func setEditing(_ editing: Bool, animated: Bool) {
            super.setEditing(editing, animated: animated)
            
            addButton.isEnabled = !editing
            if let indexPaths = collectionView?.indexPathsForVisibleItems {
                for indexPath in indexPaths {
                    collectionView?.deselectItem(at: indexPath, animated: false)
                    let cell = collectionView?.cellForItem(at: indexPath) as! PublisherCollectionViewCell
                    cell.editing = editing
                }
            }
        }
        
        func deletePublisher(_ publisher: Publisher) {
            // 1. delete publisher from the data source
            let indexPath = publishers.indexPathForPublisher(publisher)
            publishers.deleteItemsAtIndexPaths([indexPath])
            
            let layout = collectionViewLayout as! PublishersCollectionViewFlowLayout
            layout.disappearingIndexPaths = [indexPath]
            
            // 2. collectionView.deleteItemsAtIndexPaths([indexPath])
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions(), animations: { () -> Void in
                self.collectionView?.deleteItems(at: [indexPath])
            }) { (finished) -> Void in
                layout.disappearingIndexPaths = nil
            }
        }
        
        
        
        // MARK: - Add Random Items
        
        @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
            // 1. insert a new item into the data source
            let indexPath = publishers.indexPathForNewRandomPublisher()
            
            let layout = collectionViewLayout as! PublishersCollectionViewFlowLayout
            layout.appearingIndexPath = indexPath
            
            // 2. call insert item at index path so that (1) nice animation (2) doesn't lose track of scrolling
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions(), animations: { () -> Void in
                self.collectionView?.insertItems(at: [indexPath])
                }, completion: { finished in
                    layout.appearingIndexPath = nil
            })
        }
        
        
        
        
        // MARK: - UICollectionViewDataSource
        
        override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return publishers.numberOfSections
        }
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return publishers.numberOfPublishersInSection(section)
        }
        
        fileprivate struct Storyboard
        {
            static let CellIdentifier = "PublisherCell"
            static let showWebView = "ShowWebView"
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! PublisherCollectionViewCell
            
            
            
            //print("setting cell publisher var ..")
            cell.publisher = publishers.publisherForItemAtIndexPath(indexPath)
            //print("cell publisher value has bene set ...")
            
            
            
            cell.editing = isEditing
            cell.delegate = self
            
            return cell
        }
        
        override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderView
            
            if let publisher = publishers.publisherForItemAtIndexPath(indexPath) {
                headerView.publisher = publisher
            }
            
            return headerView
        }
        
        
        
        
        // MARK: - UICollectionViewDelegate
        
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if !isEditing {
                let publisher = publishers.publisherForItemAtIndexPath(indexPath)
                self.performSegue(withIdentifier: Storyboard.showWebView, sender: publisher)
            }
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == Storyboard.showWebView {
                let webViewController = segue.destination as! WebViewController
                let publisher = sender as! Publisher
                webViewController.publisher = publisher
            }
        }
        
        
        
        
        // MARK: - Dragging the Cell
        
        fileprivate var snapshot: UIView?
        fileprivate var sourceIndexPath: IndexPath?
        
        fileprivate func updateSnapshotView(_ center: CGPoint, transform: CGAffineTransform, alpha: CGFloat){
            if let snapshot = snapshot {
                snapshot.center = center
                snapshot.transform = transform
                snapshot.alpha = alpha
            }
        }
        
        func longPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
            if !isEditing {
                let location = gestureRecognizer.location(in: collectionView)
                let indexPath = collectionView?.indexPathForItem(at: location)
                
                switch gestureRecognizer.state
                {
                case .began:
                    print("began")
                    if let indexPath = indexPath {
                        sourceIndexPath = indexPath
                        let cell = collectionView?.cellForItem(at: indexPath) as! PublisherCollectionViewCell
                        
                        snapshot = cell.snapshot
                        updateSnapshotView(cell.center, transform: CGAffineTransform.identity, alpha: 0.0)
                        collectionView?.addSubview(snapshot!)
                        
                        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: UIViewAnimationOptions(), animations: { () -> Void in
                            self.updateSnapshotView(cell.center, transform: CGAffineTransform(scaleX: 1.05, y: 1.05), alpha: 0.95)
                            cell.dragging = true
                            }, completion: nil)
                    }
                case .changed:
                    self.snapshot?.center = location
                    if let indexPath = indexPath {
                        
                        // change the order of the publisher in the datasource
                        publishers.movePublisherFromIndexPath(sourceIndexPath!, toIndexPath: indexPath)
                        
                        
                        collectionView?.moveItem(at: sourceIndexPath!, to: indexPath)
                        sourceIndexPath = indexPath
                    }
                    
                default:
                    let cell = collectionView?.cellForItem(at: sourceIndexPath!) as! PublisherCollectionViewCell
                    UIView.animate(withDuration: 0.25, animations: { () -> Void in
                        self.updateSnapshotView(cell.center, transform: CGAffineTransform.identity, alpha: 0.0)
                        cell.dragging = false
                        }, completion: { (finished) -> Void in
                            self.snapshot?.removeFromSuperview()
                            self.snapshot = nil
                    })
                }
                
                
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        deinit {
            print("PublishersCollectionViewController: Object being DEINITIALIZED")
        }
        
        
 
 */
    
    
    
    
    /*
    
    
        @IBOutlet var collectionView: UICollectionView!
        var store: PhotoStore!
        let photoDataSource = PhotoDataSource()
        
        
        
        override func viewDidLoad()  {
            
            super.viewDidLoad()
            collectionView.dataSource = photoDataSource
            collectionView.delegate = self
            
            print("PhotosViewController.swift : Calling fetchRecentPhotos method (PhotoStore.swift)")
            print("***** NOTE: This request is working on  abackground thread ******")
            
            
            store.fetchRecentPhotos()   { //begin closure
                
                // NOTE: the fetchRecentPhotos has populated closure variabe with PhotosResult
                //       That result will then be used in this following code
                
                (photosResult)-> Void in
                
                // ****** IMPORTTANT *************
                //  See how Opeartion is used
                
                print("PhotosViewController.swift : Background operation completed. Now add results to store on Main thread" )
                
                OperationQueue.main.addOperation() {
                    
                    switch photosResult {
                    case let PhotosResult.success(photos):
                        print("    PhotosViewController.swift : Successfully found \(photos.count) recent photos" )
                        self.photoDataSource.photos = photos
                    case let PhotosResult.failure(error ) :
                        self.photoDataSource.photos.removeAll()
                        print("    PhotosViewController.swift : Error fetching recent photos \(error)")
                    }
                    
                    self.collectionView.reloadSections(IndexSet(integer: 0) )
                    
                } //end operation block handler
                
            } // end closure for fetchRecentPhotos
            
        }  //end method
        
        
        
        
        func collectionView (_ collectionView: UICollectionView,  willDisplay cell: UICollectionViewCell,  forItemAt indexPath: IndexPath )  {
            
            let photo = photoDataSource.photos[(indexPath as NSIndexPath).row]
            store.fetchImageForPhoto(photo) {  //begin closure
                (result) -> Void in
                
                OperationQueue.main.addOperation() {
                    let photoIndex = self.photoDataSource.photos.index(of: photo)!
                    let photoIndexPath = IndexPath(row: photoIndex, section: 0)
                    if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell {
                        cell.updateWithImage(photo.image)
                    }  // end if
                } //end operation
            } // end closure
            
        } //end method
        
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ShowPhoto" {
                if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                    let photo = photoDataSource.photos[(selectedIndexPath as NSIndexPath).row]
                    let destinationVC = segue.destination as! PhotoInfoViewController
                    destinationVC.photo = photo
                    destinationVC.store = store
                } //end if
            } //end if
        } //end method
        
        
        
    }  // end class

    
    
    */
    
    
    
    
    
    
 
 
 
 
 
 
 
 
 
    
}  // end class

