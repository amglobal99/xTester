//
//  NinthPhotoStore.swift
//  xTester
//
//  Created by Dad on 11/4/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

//
//  PhotoStore.swift


import Foundation
import UIKit
import Alamofire
import SwiftyJSON



class NinthPhotoStore: Utils, JsonConvertible {
    
    
    // MARK: - Enums
    
    enum ImageResult {
        case success(UIImage)
        case failure(Error)
    }
    
    enum PhotoError: Error {
        case imageCreationError
    }
    
    
    enum NinthPhotosResult {
        case success([NinthPhoto] )
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
    
    
    
    
    // MARK:- Methods
    
    // This function will retrieve JSON object and place it
    // in the 'jsonResultObject' variable
    func fetchJsonObject() {
        let params = ["extras":"url_h,date_taken"]
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: apiKey)  // Flickr
        
        
         // I think we need to use Operation here to insert any value son main THread
        
                let completionHandler: (Result<JSON>) -> Void  =
                    { result in
                        self.jsonResultObject = result.value!
                        print("========= Items List from fetchJsonObject method ++++++++ ")
                        if self.jsonResultObject != nil {
                            // print(jsObj)
                        }
                } // end closure
        
        //  Call the generic method to get a SwiftyJSON object
        getJSONObject(for: url, rootPath: ["photos","photo"], completionHandler: completionHandler)  // Flickr
    }
    
   
    
    // Function to retrieve array of NinthPhoto objects
    //
    func photosFromJsonObject(_ json:JSON) -> NinthPhotosResult {
        
            var finalPhotos:[NinthPhoto] = []
            var addCount = 0
        
                // print("      json object count is : \(json.count)   ")
        
                    print("***************** JSON Object *********************")
                    print(json)
                    print("***************** end JSOn object *****************")
        
        
                for ( _, jsonItem) in json {
                    if let photo: NinthPhoto  = photoFromJSONObject(jsonItem) {
                            finalPhotos.append(photo)
                        addCount += 1
                    }
                }
        
                if finalPhotos.count == 0 && json.count > 0 {
                    print("Sorry...No photos were retrieved")
                    return  NinthPhotosResult.failure(FlickrError.invalidJSONData)
                }
        
                    print("       ++++++++++++  Final Photos +++++++++++++++++")
                    print("      Array contains \(finalPhotos.count)  photos" )
        
        
                return NinthPhotosResult.success(finalPhotos)
    }  // end func
    
    
    
    // Function to get indiviaul Photo object
    // If any of the fields is unavailable, it returns a nil
    //  Many entries do nit have a URL, so that Photo wil not be returned
    //
    func photoFromJSONObject(_ json: JSON ) -> NinthPhoto? {
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
        return NinthPhoto(title: title, photoID: photoID, remoteURL: url, dateTaken: datetaken, datetakenUnknown: datetakenunknown)
    }  //end method
    
    
    
    // Function to fetch image for Photo
    func fetchImageForPhoto(_ photo: NinthPhoto, completion: @escaping (ImageResult) -> Void ) {
        
        //print("          fetchImageForPhoto: Started for \(photo.photoID) ")
        if let image = photo.image {
            completion(.success(image) )
            return
        }
        
        let photoURL = photo.remoteURL
        let request = URLRequest(url: photoURL as URL)
        
        /*
         // ============ OLD way of MAking Calls ===================================
        let task = session.dataTask(with: request, completionHandler:
            {   (data, response, error ) -> Void in
                print("          fetchImageForPhoto: Starting completion HAndler")
                let result: ImageResult = (self.processImageRequest(data: data, error: error as NSError?))
                
                if case let ImageResult.success(image) = result {
                    photo.image = image
                    print("          fetchImageForPhoto: image obtained successfully for \(photo.photoID)" )
                }
                completion(result)
        } )
        
         //print("               fetchImageForPhoto: start Task")
        task.resume()
       */
             
        // ==================== Alamofire Way of MAking Calls ==========================
            Alamofire.request(request).response
                { (response) -> Void  in
                        guard response.error  == nil else {   // got an error
                            print(response.error!)
                            return
                        }
                        guard response.data != nil else {
                            return
                        }
                        let result: ImageResult = (self.processImageRequest(data: response.data, error: response.error as NSError?))
    
                    
                        // ********** DO I NEED TO USE OPERATION HERE ????
                    
                    
                        if case let ImageResult.success(image) = result {
                            photo.image = image
                            // print("          fetchImageForPhoto: image obtained successfully for \(photo.photoID)" )
                        }
                        completion(result)
                }  // end closure
            
        
    } //end method
    

    
    
    // Function to retrieve a single Photo image
    //  parameter:  data
    func processImageRequest(data: Data?, error: NSError?) -> ImageResult {
        
        guard let  imageData = data,  let image = UIImage(data: imageData)
        else {
            //could not get image
                if data == nil {
                    return ImageResult.failure(error!)
                } else {
                    return ImageResult.failure(PhotoError.imageCreationError)
                }
        }
        return .success(image )
    } //end method

    
    
    
} //end class
