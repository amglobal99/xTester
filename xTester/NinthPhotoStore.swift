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
    
    
    
    
    
    
    /*
    
    func fetchRecentPhotos( completion: @escaping (PhotosResult) -> Void )    {
        /*
        // NOTE: I wondered how we were referencing PhotosResult here
        //     because it is declared in FlickrAPI.swift
        // I guess since Closures capture context, it has access to that var ???
        
        
        let url = FlickrAPI.recentPhotosURL()
        let request = URLRequest(url: url as URL)
        print("  PhotoStore.swift: fetchRecentPhotos: sending request for JSON data")
        
        // what folows is an instance of NSURLSessionTask ... it has  a closure
        let task = session.dataTask(with: request, completionHandler: {  (data, response, error) -> Void in    // this is a closure
            print("  PhotoStore.swift:fetchRecentPhotos: calling processRecentPhotoRequests method (in same file)")
            let result: PhotosResult = self.processRecentPhotoRequests(data: data, error: error as NSError?)
            print("  PhotoStore.swift: fetchRecentPhotos: completed processRecentPhotoRequests. Now running handler")
            completion(result)
            print("  PhotoStore.swift: fetchRecentPhotos: completed executon of handler")
        })
        
        //end closure
        
        task.resume()
        
 
        */
 
 
 
 
    } //end method
    
    
    
    
    func processRecentPhotoRequests(data: Data?, error: NSError? ) -> PhotosResult {
        
        
        /*
        
        print("      PhotoStore.swift: processRecentPhotoRequests:  Started")
        guard let jsonData = data else {
            print("      PhotoStore.swift: processRecebtPhotoRequests: returning failuer")
            return .failure(error!)
        }
        print ("      PhotoStore.swift:processRecentPhotoRequests : calling flickrapi.photosFromJSONData (FlickrAPI.swift)")
        return FlickrAPI.photosFromJSONData(jsonData)
 
 
 */
 
 
    } //end method
    
    
    
    
    func fetchImageForPhoto(_ photo: Photo, completion: @escaping (ImageResult) -> Void ) {
        
        //print("          PhotoStore.swift: fetchImageForPhoto: Started execution of method")
        if let image = photo.image {
            completion(.success(image) )
            return
        }
        
        let photoURL = photo.remoteURL
        let request = URLRequest(url: photoURL as URL)
        
        let task = session.dataTask(with: request, completionHandler:
            {
                (data, response, error ) -> Void in
                //print("          PhotoStore.swift: fetchImageForPhoto: calling processImageRequest")
                let result: ImageResult = self.processImageRequest(data: data, error: error as NSError?)
                //print("          PhotoStore.swift: fetchImageForPhoto: Finished execution of processImageRequest")
                
                if case let ImageResult.success(image) = result {
                    photo.image = image
                    print("          PhotoStore.swift: fetchImageForPhoto: image obtained successfully" )
                }
                
                //print("              PhotoStore.swift: fetchImageForPhoto: executing handler" )
                completion(result)
                //print("              PhotoStore.swift: fetchImageForPhoto: completed handler")
        } )
        
        task.resume()
        
    } //end method
    
    
    
    
    func processImageRequest(data: Data?, error: NSError?) -> ImageResult {
        
        //print("              PhotoStore.swift: processImageRequest: Starting method" )
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
    
    */
    
    
    
    
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
                    print(jsObj)
                }
        } // end closure
        
        //  Call the generic method to get a SwiftyJSON object
        getJSONObject(for: url, rootPath: ["photos","photo"], completionHandler: completionHandler)  // Flickr
    }
    
   
    
    // Function to retrieve array of NinthPhoto objects
    func photosFromJsonObject(_ json:JSON) -> NinthPhotosResult {
                var finalPhotos:[NinthPhoto] = []
                for ( _, jsonItem) in json {
                    if let photo: NinthPhoto  = photoFromJSONObject(jsonItem) {
                            finalPhotos.append(photo)
                    }
                }
            
                if finalPhotos.count == 0 && json.count > 0 {
                    print("Sorry buddy...went wrong")
                    return      NinthPhotosResult.failure(FlickrError.invalidJSONData)
                }
        
                return NinthPhotosResult.success(finalPhotos)
    }  // end func
    
    
    
    
    // Function to get indiviaul Photo object
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
    
    

    
    
    
    
    func processRecentPhotoRequests() { }
    
    
    func fetchImageForPhoto () {  }
    
    
    func processImageRequest() {  }
    
    
    
    

    
    
    
} //end class
