//
//  GlobalConstants.swift
//  xTester
//
//  Created by Dad on 10/14/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation


struct Constants {

    
    
    struct FlickrApi {
        
        
        
    }  // end struct
    
    
    
    
    
    
    
    struct Configuration {
        static let companyName = "Natsys International"
        static let companyAddress = "1808 Mountain Lake Dr GA 30339"
        
        
        // Use This section works for Flickr API
         static let apiKey = "a6d819499131071f158fd740860a5a88"
         static let method = "flickr.photos.getRecent"
         static let params = ["extras":"url_h,date_taken"]
         static let rootPath = ["photos","photo"]
         static let key = "datetakenunknown"
         static let dataKey = "id"
        
         enum Method: String {
            case RecentPhotos = "flickr.photos.getRecent"
         }
        
        
        
        
        /*
        // Use this for Github API
        static let apiKey:String? = nil
        static let method:String? = nil
        static let params:[String:String]? = nil
        static let rootPath:[String]? = nil
        static let key = "id"
        static let dataKey = "clone_url"
        */
        
        
        /*
        // Use this for bikeNYC API
        static let apiKey:String? = nil
        static let method:String? = nil
        static let params:[String:String]? = nil
        static let rootPath:[String]? = ["stationBeanList"]    // BikeNYC
        static let key = "id"
        static let dataKey = "statusValue"
        
        */

        /*
        // Use this for Google API
        static let apiKey:String? = nil
        static let method:String? = nil
        static let params:[String:String]? = nil
        static let rootPath:[String]? = ["responseData","feed","entries"]   // Google API
        static let key = "author"
        static let dataKey = "title"
        
        */
        
        
        
        
        // Enum store sthe various URLs we use for testing
        enum jsonTestUrl:String {
            // Flickr API: root is ["photos","photo"]
            case flickr = "https://api.flickr.com/services/rest"
            
            // bikeNYC: root is  ["stationBeanList"]
            case bikeNYC = "http://citibikenyc.com/stations/json"
            
            /// Google API: root is  ["responseData","feed","entries"]
            case google = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=8&q=http%3A%2F%2Fnews.google.com%2Fnews%3Foutput%3Drss"
            
            // jsonplaceholder.typicode.com:   root is
            case jsonPlaceholder1 = "https://jsonplaceholder.typicode.com/todos/1"
            case jsonPlaceholder2 = "https://jsonplaceholder.typicode.com/todos"
            
            // GitHub: root is [] .... objects start at root
            case gitHub = "https://api.github.com/users/amglobal99/repos"
        }
      
        
        
        
        
        
        // Date Formatter
        static let dateFormatter: DateFormatter = {
            let formatter  = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return formatter
        }()
        
        
        // Session
        static let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
        }()
        
        
        
    } // end struct
    
  
    
    
    
    
    struct GistApi  {
        static let baseUrl = "https://github.com"
    }





}  // end struct
