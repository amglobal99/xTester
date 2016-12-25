//
//  GlobalConstants.swift
//  xTester
//
//  Created by Dad on 10/14/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import Alamofire



    
    typealias ClosureJSON<T> = (T) -> Void




struct Constants {

  
    struct AlamofireNatsysApi {
        
        enum AlamofireNatsysAPIError: Error {
            case network(error: Error)
            case apiProvidedError(reason: String)
            case authCouldNot(reason: String)
            case authLost(reason: String)
            case objectSerialization(reason: String)
            case other(reason:String)
        }
        
        
    }  // end struct
    
    
    
    
    
    struct FlickrApi {
      
      // Use This section for Flickr API
      static let apiKey = "a6d819499131071f158fd740860a5a88"
      static let method = "flickr.photos.getRecent"
      static let params = ["extras":"url_h,date_taken"]
      static let rootPath = ["photos","photo"]
      static let key = "datetakenunknown"
      static let dataKey = "id"
      
      enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
      }

    }  // end struct
    
  
  
  
  
  struct BikeNycApi {
    
    // Use this for bikeNYC API
    static let apiKey:String? = nil
    static let method:String? = nil
    static let params:[String:String]? = nil
    static let rootPath:[String]? = ["stationBeanList"]    // BikeNYC
    static let key = "id"
    static let dataKey = "statusValue"
    
  }
  
  
  
  struct GistApi  {
    static let baseUrl = "https://github.com"
  }
  
  

  
  
    
    struct Configuration {
        
        static let companyName = "Natsys International"
        static let companyAddress = "1808 Mountain Lake Dr GA 30339"
      
      /*
      struct SiteParamaters {
        let apiKey: String
        let method: String
        let params: [String:String]
        let rootPath: [String]
        let key: String
        let dateKey: String
      }
      
      
      enum testWebSite {
        case Flickr
        case BikeNyc
        case Gist
        case Google
      }
      
      */
      
      
      
      
      
      
      
      
      
        // Use This section for Flickr API
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
        
      
      
      
      enum TestSite {
        
        init?(rawValue: String){
            switch rawValue{
                case "FLICKR":
                  self = .flickr
                case "GITHUB":
                  self = .github
                case "BIKENYC":
                  self = .bikenyc
                  case "GOOGLE":
                  self = .google
                case "TYPICODE":
                  self = .typicode
                default:
                  return nil
            }
        }
        
        case flickr
        case github
        case bikenyc
        case google
        case typicode
        
        
        
        var urlString:String {
          switch self {
              case .flickr:
                return "https://api.flickr.com/services/rest"
              case .github:
                return  "https://api.github.com/users/amglobal99/repos"
              case .bikenyc:
                return "http://citibikenyc.com/stations/json"
              case .google:
                return "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=8&q=http%3A%2F%2Fnews.google.com%2Fnews%3Foutput%3Drss"
              case .typicode:
                  return "https://jsonplaceholder.typicode.com/todos"
          }
        }
        
        var apiKey: String?  {
          switch self {
              case .flickr:
                  return "a6d819499131071f158fd740860a5a88"
              case .github:
                return nil
              case .bikenyc:
                return nil
              case .google:
                 return nil
              case .typicode:
                return nil
          }
        }
        
        var method: String?  {
          switch self {
              case .flickr:
                return "flickr.photos.getRecent"
              case .github:
                return nil
              case .bikenyc:
                return nil
              case .google:
                return nil
              case .typicode:
                return nil
          }
        }

        var params: [String:String]?  {
          switch self {
              case .flickr:
                return ["extras":"url_h,date_taken"]
              case .github:
                return nil
              case .bikenyc:
                return nil
              case .google:
                return nil
              case .typicode:
                return nil
              }
        }
        
        var rootPath: [String]?  {
          switch self {
              case .flickr:
                return ["photos","photo"]
              case .github:
                return nil
              case .bikenyc:
                return ["stationBeanList"]
              case .google:
                return ["responseData","feed","entries"]
              case .typicode:
                return nil
          }
        }
        
        var key: String?  {
          switch self {
              case .flickr:
                return "datetakenunknown"
              case .github:
                return "id"
              case .bikenyc:
                return "id"
              case .google:
                return "author"
              case .typicode:
                return nil
             }
        }
        
        var dataKey: String?  {
          switch self {
              case .flickr:
                return "id"
              case .github:
                return "clone_url"
              case .bikenyc:
                return "statusValue"
              case .google:
                return "title"
              case .typicode:
                return nil
          }
        }
        
      
      } // end enum
      
      


      
        /*
        
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
      
      
      */
      
      
      
      
      
      
        // MARK: - Date/Time/Calendar
        
        // Date Formatter
        static let dateFormatter: DateFormatter = {
            let formatter  = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return formatter
        }()
        
        
        let filemgr = FileManager.default
        var calendar: Calendar = Calendar(identifier: .gregorian )
        var locale = Locale(identifier: "en_US")
        
        
        
        // MARK: - Session
        
        
        // Session
        static let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
        }()
        
        
        
    } // end struct
    
  
    
    
    
  


}  // end struct
