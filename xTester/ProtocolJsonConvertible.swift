//
//  ProtocolJsonConvertible.swift
//  xTester
//
//  Created by Dad on 10/29/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit
import BRYXBanner
import Alamofire
import SwiftyJSON




// Define empty protocol
protocol JsonConvertible {}


// define an extension
extension JsonConvertible  {
    
    
    
    //  ******************  SwiftyJSON Section   **************************************
    //
    //
    
    
   
    // **************************************************************
    //  This function gives as a SwifyJSON  'JSON' object
    //  You just have to pass in a Url string
    //  param - rootPath: specify the levels as an array
    //  For example, if my data is under 'employees' rooot attribute
    //  and within that, it is under the 'users' attribute
    //  Then your array will contain ["employees","users"]
    //
    // **************************************************************
    

    //func getJSONObject(for url:String, completionHandler:  @escaping (Result<JSON>) ->
    func getJSONObject(for url:URL, rootPath:[String]?, completionHandler:  @escaping (Result<JSON>) ->  Void ) {
        
            //print("getJSONObject...  starting ")
        
        
        
            let urlRequest = URLRequest(url: url)
        
                Alamofire.request(urlRequest).responseJSON
                    { (response) -> Void  in
                            guard response.result.error == nil else {   // got an error
                                print(response.result.error!)
                                return
                            }
                            guard response.result.value != nil else {
                                return
                            }
                    
                        let jsonObject:JSON  = JSON(response.result.value!)  // convert Response to JSON
                   
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
                        } // if rootPath =  nil
                        
                    }  // end Alamofire request
    } // end function
    

    
    
    
    // ***************************************************************************************
    // This function gives us an array of values.
    //  We can use this function with a basic json array
    // or an array whihc is 1 level deep
    // For example, let's say we have "employees" as root, and within that
    // we have {"id":2,"name":"john"}, ........
    // That is an exmpple of 1 level deep. Without employees, it is flat
    // NOTE: To acces an array thta is at say 3 level, use this format
    //  for object in  jsonObject["responseData","feed","entries"].array!
    // ****************************************************************************************
    
    func getKeyArray(from jsonObject:JSON?,  key:String?) -> [String]? {
        
        // print("getKeyArray from Protool.... started")
        
        
        guard let jsonObject = jsonObject, let key = key  else {
            return nil
        }
    
        var arrayNames:[String] = []
        
            for (_, object) in  jsonObject {
                let name = object[key].stringValue
                //let name = object[key2].rawValue
                arrayNames.append(name)
            }
            
            // remove duplicates
            let  result  = Array(Set(arrayNames)).sorted()
        
        /*
            print(" +++++++++ Key Array +++++++++++++++++++++")
            print(result)
            print("++++++++++++ end key array +++++++++++++++")
        
        */
        
            return result
        
    } // end func
    
    
    
    
    
    

    // This functon will give us a Dictionary
    // For each key, we will return an array of values
    // For example, from my JSON, I want to categorize by City
    // So I want a Dictionary with City as key and an array as its values
    // param  obj :  This is the JSON object of type SwiftyJSON.JSON
    // param  key:  This is the key we want to categorize on
    // param rootAtribute:  Thisis the root element
    
    func getDictionary(from obj:JSON?,  for key:String?,  keyArray:[String]?, dataKey:String? ) -> [String:[String]]? {
        
        //  print("getDictionary... Starting ******")
        guard let obj = obj, let key = key, let keyArray = keyArray, let dataKey = dataKey else {
            return nil
        }
        print(obj.count)
        // print(obj)
        var keyItems:[String] = []
        var myDict:[String:[String]] = [:]   // Create a Dictionary to hold our data
        
        // Now, for each key in keyArray, we need to get all elements and create a Dictinary item
        
        for i in keyArray {
            for (_, things) in obj {
                if things[key].string == i {
                    keyItems.append(things[dataKey].stringValue)
                }
            } // end for loop
            
            // Let's remove Duplicates .... may not be necessary
            keyItems = Array(Set(keyItems)).sorted()
            
            myDict.updateValue(keyItems, forKey: i)   // add entry into Dictionary
            keyItems.removeAll()   // clear our holding array
        } // for i in
        
        // Return value of Dictionary
        return myDict
        
    } // end func
    
    

    
    /*
    
    // This returns Dict wih values as array of Photos
    
    func getDictionaryOfItems(from obj:JSON?,  for key:String?,  keyArray:[String]?, dataKey:String? ) -> [String:JSON]? {
        
        print(" key : \(key!) "  )
        print(" dataKey : \(dataKey!) " )
        
        //  print("getDictionary... Starting ******")
        guard let obj = obj, let key = key, let keyArray = keyArray, let dataKey = dataKey else {
            return nil
        }
        
        print("There are : \(obj.count)  items in JSON object ")
        
        
        // print(obj)
        
        
        var keyItems:[JSON] = []
        var myDict:[String:[JSON]] = [:]   // Create a Dictionary to hold our data
        
        
        
        // Now, for each key in keyArray, we need to get all elements and create a Dictinary item
        
        for i in keyArray {
            for (_, things) in obj {
                if things[key].string == i {
                    
                    keyItems += obj
                    
                    //keyItems.append(obj)
                    
                    
                   // keyItems.append(things[dataKey].stringValue)
                }
            } // end for loop
            
            // Let's remove Duplicates .... may not be necessary
            //keyItems = Array(Set(keyItems)).sorted()
            
            myDict.updateValue(keyItems, forKey: i)   // add entry into Dictionary
            keyItems.removeAll()   // clear our holding array
        } // for i in
        
        // Return value of Dictionary
        return myDict
        
    } // end func
    

    
    
    
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
