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
    
    
    
  struct flickrApi {
    
  }
  
  
    
    struct Configuration {
        
        static let companyName = "Natsys International"
        static let companyAddress = "1808 Mountain Lake Dr GA 30339"
      
      
      
      
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
