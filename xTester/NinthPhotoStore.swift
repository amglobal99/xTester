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

    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    
    let dateFormatter: DateFormatter = {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    
    
    let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
    let APIKey = "a6d819499131071f158fd740860a5a88"
    let method = "flickr.photos.getRecent"
    var jsonResultObject:JSON?
    
    
    
    // This function will retrieve JSON object and place it
    // in the 'jsonResultObject' variable
    func fetchJsonObject() {
        let params = ["extras":"url_h,date_taken"]
        let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: APIKey)  // Flickr
        
                let completionHandler: (Result<JSON>) -> Void  =
                    { result in
                        self.jsonResultObject = result.value!
                        print("========= Items List ++++++++ ")
                        if let jsObj = self.jsonResultObject {
                            // print(jsObj)
                        }
                } // end closure
        
        //  Call the generic method to get a SwiftyJSON object
        getJSONObject(for: url, rootPath: ["photos","photo"], completionHandler: completionHandler)  // Flickr
    }
    
   
    

    
    
    // Function to retrieve array of NinthPhoto objects
    //
    //
    func photosFromJsonObject(_ json:JSON) -> NinthPhotosResult {
                // print("      photosFromJSonObject:   starting ......")
                var finalPhotos:[NinthPhoto] = []
                // print("      json object count is : \(json.count)   ")
        
        /*
                print("***************** JSON Object *********************")
                print(json)
                print("***************** end JSOn object *****************")
        
        */
        
                var addCount = 0
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
        
        /*
                print("       ++++++++++++  Final Photos +++++++++++++++++")
                print("      Array contains \(finalPhotos.count)  photos" )
        */
        
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
            let datetaken = dateFormatter.date(from: dateString)
        else {
                return nil    // don't have enough info, print("returing nil here" )
        }
        
        return NinthPhoto(title: title, photoID: photoID, remoteURL: url, dateTaken: datetaken)
    }  //end method
    
    

    
    
    
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
    
                        if case let ImageResult.success(image) = result {
                            photo.image = image
                            // print("          fetchImageForPhoto: image obtained successfully for \(photo.photoID)" )
                        }
                        completion(result)
                }  // end closure
            
        
    } //end method
    

    
    
    // Function to retrieve a single Photo image
    //  parameter:  data 
    //  parameter:  error
    
    func processImageRequest(data: Data?, error: NSError?) -> ImageResult {
      //  print("              PhotoStore.swift: processImageRequest: Starting method" )
        guard let  imageData = data,  let image = UIImage(data: imageData) else {
            //could not get image
            if data == nil {
                return ImageResult.failure(error!)
            } else {
                return ImageResult.failure(PhotoError.imageCreationError)
            }
        }
        //print("              PhotoStore.swift: processImageRequest: returning sucess" )
        return .success(image )
    } //end method

    
    
    
} //end class
