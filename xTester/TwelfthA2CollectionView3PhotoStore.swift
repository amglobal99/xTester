//
//  TwelfthA2CollectionView3PhotoStore.swift
//  xTester
//
//  Created by Dad on 11/25/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON



class TwelfthA2CollectionView3PhotoStore: Utils, JsonConvertible {
    
    
    // MARK: - Enums
    enum ImageResult {
        case success(UIImage)
        case failure(Error)
    }
    
    enum PhotoError: Error {
        case imageCreationError
    }
    
    enum TwelfthA2PhotosResult {
        case success([TwelfthA2Photo] )
        case failure(Error)
    }
    
    enum FlickrError: Error {
        case invalidJSONData
    }
    
    
    // MARK: - Local Variables
    let session = Constants.Configuration.session
    let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
    let apiKey = Constants.Configuration.apiKey
    let method  = Constants.Configuration.method
    var jsonResultObject:JSON?
    
    
    
    
    // MARK:- JSON Methods
    
    // This function will retrieve JSON object and place it in the 'jsonResultObject' variable
    func fetchJsonObject() {
        
        let completionHandler: (Result<JSON>) -> Void  =
            { result in
                self.jsonResultObject = result.value!
                print("========= Items List from fetchJsonObject method ++++++++ ")
                if self.jsonResultObject != nil {
                    // print(jsObj)
                }
        } //end closure
        
        //  Call the generic method to get a SwiftyJSON object
        let params = ["extras":"url_h,date_taken"]
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: apiKey)  // Flickr
        getJSONObject(for: url, rootPath: ["photos","photo"], completionHandler: completionHandler)  // Flickr
    }
    
    
    
    
    
    
    /** 
     Function retrieves an array of TwelfthA2Photo objects.
     - Parameter json:  a SwiftyJSON object
     - Returns:         an array of TwelfthA2Photo objects
    */
    func photosFromJsonObject(_ json:JSON) -> TwelfthA2PhotosResult {
        var finalPhotos:[TwelfthA2Photo] = []
        var addCount = 0
        print("***************** JSON Object *********************")
        print(json)
        print("***************** end JSOn object *****************")
        
        for ( _, jsonItem) in json {
            if let photo: TwelfthA2Photo = photoFromJSONObject(jsonItem) {
                finalPhotos.append(photo)
                addCount += 1
            }
        } // end for
        if finalPhotos.count == 0 && json.count > 0 {
            print("Sorry...No photos were retrieved")
            return  TwelfthA2PhotosResult.failure(FlickrError.invalidJSONData)
        }
        print("       ++++++++++++  Final Photos +++++++++++++++++")
        print("      Array contains \(finalPhotos.count)  photos" )
        
        return TwelfthA2PhotosResult.success(finalPhotos)
    } // end func
    
    
    
    
    /**
        Function to get individual Photo object.
        If any of the fields are unavailable, it returns a nil.
        Many entries do not have a URL, so that Photo wil not be returned.
     
        - Parameter json:   a SwiftyJSON object
        - Returns:          An instance of TwelfthA2Photo
    */
    func photoFromJSONObject(_ json: JSON ) -> TwelfthA2Photo? {
        guard
            let photoID = json["id"].string,
            let title = json["title"].string,
            let dateString = json["datetaken"].string,
            let photoURLString = json["url_h"].string,
            let url = URL(string: photoURLString),
            let datetaken = Constants.Configuration.dateFormatter.date(from: dateString),
            let datetakenunknown = json["datetakenunknown"].string
            else {
                return nil    // don't have enough info, print("returing nil here" )
        }
        return TwelfthA2Photo(title: title, photoID: photoID, remoteURL: url, dateTaken: datetaken, datetakenUnknown: datetakenunknown)
    } //end method
    
    
    
    
    
    // MARK: - Fetch Image
    
    
    
    /** 
        Function to fetch image for Photo using URL for photo.
        - Parameter photo:  a TwelfthA2Photo object
    
     */
    func fetchImageForPhoto(_ photo: TwelfthA2Photo, completion: @escaping (ImageResult) -> Void ) {
        if let image = photo.image {
            completion(.success(image) )
            return
        }
        let photoURL = photo.remoteURL    // Get the URL for the Photo
        Alamofire.request(photoURL).response
            { response in
                guard response.error  == nil else {   // got an error
                    print(response.error!)
                    return
                }
                guard response.data != nil else {
                    return
                }
                let result: ImageResult = self.processImageRequest(data: response.data, error: response.error as NSError?)
                
                //  Use 'if case' to see if 'result' var contaisn .success as its value
                if case let ImageResult.success(image) = result {
                    photo.image = image
                }
                completion(result)
        }  // end closure
    } //end method
    
    
    
    // Function to retrieve a single Photo image
    //
    func processImageRequest(data: Data?, error: NSError?) -> ImageResult {
        guard let  imageData = data,  let image = UIImage(data: imageData)   else {
            //could not get image
            if data == nil {
                return ImageResult.failure(error!)
            } else {
                return ImageResult.failure(PhotoError.imageCreationError)
            }
        }
        return .success(image )
    }
    
    
    
    
    
    
    // MARK: Section Dictionary
    
    
    
    // Function that returns a Dictionary with SectionTitle as key and array of Photos as it values
    func sectionPhotosDictionary(from obj:JSON?, for key:String? ) -> [String:[TwelfthA2Photo]]? {
        var keyArray:[String] = []
        var photoItems:[TwelfthA2Photo] = []
        var sectionPhotosDictionary:[String:[TwelfthA2Photo]] = [:]   // Create a Dictionary to hold our data
        guard let obj = obj, let key = key else {
            return nil
        }
        print("sectionPhotosDictionary: Processing \(obj.count) objects. Key: \(key)  ")
        
        // get array of section Titles
        keyArray = getSectionTitlesArray(from: obj, key: key)!
        
        // For each key in keyArray ( these are the section Titles)
        // get all elements and create a Dictinary item
        for i in keyArray {
            for (_, things) in obj {
                if String(describing: things[key].rawValue) == i  {
                    if  let photo = photoFromJSONObject(things) {
                        photoItems.append(photo)
                    }
                }
            } //end for
            sectionPhotosDictionary.updateValue(photoItems, forKey: i)   // add entry into Dictionary
            photoItems.removeAll()   // clear our holding array
        } // for i in
        
        //print(" +++++++++++ Section Photo Dictionary ++++++++++++++++")
        //print(sectionPhotosDictionary)
        
        return sectionPhotosDictionary   // Return value of Dictionary
        
    } // end func
    
    
    
    
    /**
     Returns the Row and Section for a particular photo
     
     - Parameter dict:  A Dcitionary with the section title as the key and array of photos as values
     - Parameter photo: The photo for which we want to identify the row number and section number
     
     - Returns: A tuple with the row number and section number
     
     */
    func indexForPhoto ( dict:[String:[TwelfthA2Photo]], photo:TwelfthA2Photo ) -> (Int,Int)? {
        var section:String?
        var result:(Int,Int)?
        
        /*
         for (key, value) in dict {
         if  value.contains(photo) {
         section = key
         }
         }
         */
        
        // Filter the Dictionary. Retrieve key for entry which contains this photo in its values
        section = dict.filter{$1.contains(photo)}.first?.key
        
        // get array of photos for our setion
        if let section = section,  let photoArray = dict[section], let row = photoArray.index(of: photo) {
            result =  (row, Int(section)!)
        }
        return result
    }
    
    
    
    
    
} //end class
