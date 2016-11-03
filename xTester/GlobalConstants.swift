//
//  GlobalConstants.swift
//  xTester
//
//  Created by Dad on 10/14/16.
//  Copyright © 2016 Natsys. All rights reserved.
//



struct Constants {

    
    
    struct FlickrApi {
        static let baseUrl = "https://flickrapi.com"
    }
    
    
    
    struct Configuration {
        static let companyName = "Natsys International"
        static let companyAddress = "1808 Mountain Lake Dr GA 30339"
        
        enum jsonTestUrl:String {
            case flickr = "https://api.flickr.com/services/rest"
            case bikeNYC = "http://citibikenyc.com/stations/json"
            case google = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=8&q=http%3A%2F%2Fnews.google.com%2Fnews%3Foutput%3Drss"
            case jsonPlaceholder1 = "https://jsonplaceholder.typicode.com/todos/1"
            case jsonPlaceholder2 = "https://jsonplaceholder.typicode.com/todos"
            case gitHub = "https://api.github.com/users/amglobal99/repos"
        }
        

        
        
    } // end struct
    
  
    struct GistApi  {
        static let baseUrl = "https://github.com"
    }





}  // end struct
