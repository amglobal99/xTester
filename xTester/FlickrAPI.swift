//
//  FlickrAPI.swift
//  xTester
//
//  Created by Dad on 11/4/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

//
//  FlickrAPI.swift

import Foundation

enum Method: String {
    case RecentPhotos = "flickr.photos.getRecent"
}

enum PhotosResult {
    case success([Photo] )
    case failure(Error)
}

enum FlickrError: Error {
    case invalidJSONData
}



struct FlickrAPI {
    
    fileprivate static let baseURLString = "https://api.flickr.com/services/rest"
    fileprivate static let APIKey = "a6d819499131071f158fd740860a5a88"
    
    fileprivate static let dateFormatter: DateFormatter = {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    
    
    fileprivate static func flickrURL(method: Method, parameters: [String:String]? ) -> URL {
        
        var components = URLComponents(string: baseURLString )!
        var queryItems = [URLQueryItem]()
        
        let baseParams  = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": APIKey
        ]
        
        
        for(key,value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        
        if let additionalParams = parameters{
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value )
                queryItems.append(item)
            } //end for loop
        } //end if
        
        components.queryItems = queryItems
        return components.url!
        
    } //end method
    
    
    static func recentPhotosURL() -> URL {
        return flickrURL(method: Method.RecentPhotos, parameters: ["extras":"url_h,date_taken"])
    }
    
    
    static func photosFromJSONData(_ data: Data) -> PhotosResult {
        
        do {
            print("         FlickrApi.swift: photosFromJSONData: starting..." )
            let jsonObject: Any = try JSONSerialization.jsonObject(with: data, options: [])
            // print (jsonObject)
            
            guard let
                jsonDictionary = jsonObject as? [AnyHashable: Any],
                let photos = jsonDictionary["photos"] as? [String:AnyObject],
                let photosArray = photos["photo"] as? [[String:AnyObject]]
                else {
                    print("json does not match")
                    //json does not match
                    return PhotosResult.failure( FlickrError.invalidJSONData )
            }
            
            print ("         FlickrAPI.swift: photosFromJSONData: photo Array count is \(photosArray.count) " )
            
            
            var finalPhotos = [Photo]()
            
            // get Individual photos
            for photoJSON in photosArray {
                if let photo: Photo  = photoFromJSONObject(photoJSON) {
                    finalPhotos.append(photo)
                }
            }
            
            
            print("         FlickrAPI.swift: photosFromJSONData: Final number of photos is \(finalPhotos.count) " )
            
            
            if finalPhotos.count == 0 && photosArray.count > 0 {
                print("Sorry buddy...went wrong")
                //we werent able to parse any of the photos
                return PhotosResult.failure(FlickrError.invalidJSONData)
            }
            
            
            return PhotosResult.success(finalPhotos)
        }
        catch let error {
            print("stumbled into ctach block" )
            return PhotosResult.failure(error)
            
        }
        
        
        
    }  //end method
    
    
    fileprivate static func photoFromJSONObject(_ json: [String : AnyObject] ) -> Photo? {
        
        
        
        guard let
            photoID = json["id"] as? String,
            let title = json["title"] as? String,
            let dateString = json["datetaken"] as? String,
            let photoURLString = json["url_h"] as? String,
            let url = URL(string: photoURLString),
            let datetaken = dateFormatter.date(from: dateString)
            
            else {
                // don't have enough info
                //print("returing nil here" )
                return nil
        }
        
        // return Photo(title: title, photoID: photoID, remoteURL: url, dateTaken: dateTaken)
        
        // return Photo(title: title, photoID: photoID, remoteURL: url, dateTaken: datetaken)
        
        return Photo(title: title, photoID: photoID, remoteURL: url, dateTaken: datetaken)
        
    }  //end method
    
    
    
}  //end struct


