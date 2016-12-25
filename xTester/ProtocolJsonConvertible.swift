//
//  ProtocolJsonConvertible.swift
//  xTester
//
//  Created by Dad on 10/29/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


// MARK: - Protocols

// Define empty protocol
protocol JsonConvertible: Utils {}


// MARK: - Extensions

// define an extension
extension JsonConvertible  {
    
    
    
    
// MARK: - Methods
    
  
    ///   This function gives as a SwifyJSON  'JSON' object
    ///    The results are placed in the Result variable
    ///
    ///   The rootpath is the path to your JSON entries.
    ///   For example, if my data is under 'employees' root attribute
    ///   and within that, it is under the 'users' attribute
    ///   Then your array will contain ["employees","users"]
    ///
    ///     - Parameter: url:  A URL object for your REST API
    ///     - Parameter rootPath: The root path for your JSON object
    ///
    ///     - Returns: Nothing
  
    func getJSONObject(for url:URL, rootPath:[String]?, completionHandler:  @escaping (Result<JSON>) ->  Void ) {
      
        guard url != nil else {
          return
        }
      
        let urlRequest = URLRequest(url: url)
      
          // Check for Internet Connection before sending Request
          if Reachability.isConnectedToNetwork() == true {
              print("Internet connection OK")
          } else {
              print("Internet connection FAILED")
              showBanner(title: "No Connection", subtitle: "Please try again when Internet connection \n is available !!", image: nil, bkColor: UIColor.red)
               return
          }
      
          // Send Alamofire request
          Alamofire.request(urlRequest)
                      .validate()
                      .responseJSON
          { response  in
              // First check if user Authenticated
              //..........
            
              // Check if an Error is present
              guard response.result.error == nil else {   // got an error
                  print("Printing ERROR ")
                  print(response.result.error!)
                  completionHandler(Result.failure(response.result.error!) )
                  return
              }
              guard response.result.value != nil else {  // Data is nil
                  print("Request did not return any data")
                  return
              }
              //convert Response to SwiftyJSON object
              let jsonObject:JSON  = JSON(response.result.value!)
         
              if rootPath == nil {
                  completionHandler(Result.success(jsonObject))
              } else {
                  if let pathCount  = rootPath?.count  {
                      switch pathCount  {
                          case 1:
                              let result = jsonObject[ (rootPath?[0])! ]
                              completionHandler(Result.success(result))
                          case 2:
                              let result = jsonObject[ (rootPath?[0])!,(rootPath?[1])! ]
                              completionHandler(Result.success(result))
                          case 3:
                              let result =  jsonObject[ (rootPath?[0])!,(rootPath?[1])!,(rootPath?[2])!    ]
                              completionHandler(Result.success(result))
                          case 4:
                              let result =  jsonObject[ (rootPath?[0])!,(rootPath?[1])!,(rootPath?[2])!, (rootPath?[3])!    ]
                              completionHandler(Result.success(result))
                          default:
                              completionHandler(Result.success(jsonObject))
                      }
                    
                  } else { // must be nil
                      completionHandler(Result.success(jsonObject))
                  }
              }//if rootPath =  nil
            }  // end Alamofire request
      
        
    } // end function
    

    
    
    
    
    
    
    
    
    
    
    
    /**
         This function gives us an array of key values.
         We can use this function with a basic json array
         or an array which is 1 level deep
         
         For example, let's say we have "employees" as root, and within that
         we have {"id":2,"name":"john"}, ........
         That is an example of 1 level deep. Without employees, it is flat
         
         NOTE: To acces an array thta is at say 3 level, use this format
          for object in  jsonObject["responseData","feed","entries"].array!
         
         - Parameter jsonObject: This is the SwiftyJSON object
         - Parameter key:   The key that serves as the section title
         
         - Returns: An array of section title names
    */
    
    func getSectionTitlesArray(from jsonObject:JSON?,  key:String?) -> [String]? {
        guard let jsonObject = jsonObject, let key = key  else {
            return nil
        }
        let arrayNames:[String] = jsonObject.arrayValue.map({$0[key].stringValue})
        let result   = Array(Set(arrayNames)).sorted()   //Remove Duplicates
        return result
    } // end func
    
    
    
    
    
    

    // This functon will give us a Dictionary
    // For each key, we will return an array of values
    // For example, from my JSON, I want to categorize by City
    // So I want a Dictionary with City as key and an array as its values
    // param  obj :  This is the JSON object of type SwiftyJSON.JSON
    // param  key:  This is the key we want to categorize on
    // param rootAtribute:  Thisis the root element
    
    func getDictionary(from obj:JSON?, for key:String?, keyArray:[String]?, dataKey:String? ) -> [String:[String]]? {
        var keyItems:[String] = []
        var myDict:[String:[String]] = [:]   // Create a Dictionary to hold our data
        
        guard let obj = obj, let key = key, let keyArray = keyArray, let dataKey = dataKey else {
            return nil
        }
        print("getDictionary: Processing \(obj.count) objects. Key: \(key)  dataKey: \(dataKey) ")
    
        // For each key in keyArray, get all elements and create a Dictinary item
        for i in keyArray {
            for (_, things) in obj {
                // if things[key].string == i {
                if String(describing: things[key].rawValue) == i  {
                    keyItems.append(things[dataKey].stringValue)
                }
            } // end for loop
            
            keyItems = Array(Set(keyItems)).sorted()   // Remove Duplicates .... may not be necessary
            myDict.updateValue(keyItems, forKey: i)   // add entry into Dictionary
            keyItems.removeAll()   // clear our holding array
        } // for i in keyArray
        
        return myDict   // Return value of Dictionary

    } // end func
    
    
    
    
    
    // Thid function will give us the array of values associated with a key
    //  For example, my Tableview needs all values for a particular section, say "teams"
    //  we just lookup the key "teams" in our dict and retrieve values for that key
    //  An array is returned
    //
    
    func getDictionaryValues(fromDictionary dict:[String:[String]]?, for key:String?) -> [String]? {
        
        guard let dict = dict, let key = key else{
            return nil
        }
        guard let result:[String] =  dict[key] else {
            return nil
        }
        
        return result
    }
    
    
    
    
        
    
    
}   // end extension
