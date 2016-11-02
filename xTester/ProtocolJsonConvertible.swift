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
    //  You juts have to pass in a Url string
    //
    // **************************************************************
    

    func getJSONObject(for url:String, completionHandler:  @escaping (Result<JSON>) -> Void ) {
            print("getJSONObject...  starting ")
            guard let url = URL(string: url)  else {
                return
            }
        
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
                            let jsonObject:JSON  = JSON(response.result.value!)  // convert Respons eto JSON
                            completionHandler(Result.success(jsonObject))
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
    
    func getKeyArray(from jsonObject:JSON, for key1:String?, and key2:String) -> [String]? {
        print("getKeyArray from Protool.... started")
        var arrayNames:[String] = []
        
        if let myKey1 = key1 {
            for object in  jsonObject[myKey1].array! {
            //for object in  jsonObject[myKey1].arrayValue {
                let name = object[key2].stringValue
                //let name = object[key2].rawValue
                arrayNames.append(name)
            }
        } else {
                for (_, object) in jsonObject {
                    let name = object[key2].stringValue
                    arrayNames.append(name)
                }
        } // end if
        
             return Array(Set(arrayNames)).sorted()
        
    } // end func
    
    
    
    
    
    

    // This functon will give us a Dictionary
    // For each key, we will return an array of values
    // For example, from my JSON, I want to categorize by City
    // So I want a Dictionary with City as key and an array as its values
    // param  obj :  This is the JSON object of type SwiftyJSON.JSON
    // param  key:  This is the key we want to categorize on
    // param rootAtribute:  Thisis the root element
    
    func getDictionary(from obj:JSON, root rootAttribute:String, for key:String,  keyArray:[String], dataKey:String ) -> [String:[String]]? {
        
        print("getDictionary... Starting ******")
        let  arrayToProcess = obj[rootAttribute].arrayValue
        print(arrayToProcess.count)
        print(arrayToProcess)
        var keyItems:[String] = []
        var myDict:[String:[String]] = [:]   // Create a Dictionary to hold our data
        
        // Now, for each key in keyArray, 
        //we need to get all elements and create a Dictinary item
        
        for i in keyArray {
            for things in arrayToProcess {
                if things[key].string == i {
                    //print("Match found here ...")
                    keyItems.append(things[dataKey].stringValue)
                }
            }
            
            // Let's remove Duplicates .... may not be necessary
            keyItems = Array(Set(keyItems)).sorted()
            
            myDict.updateValue(keyItems, forKey: i)   // add entry into Dictionary
            keyItems.removeAll()   // clear our holding array
        } // for i in
        
        // Return value of Dictionary
        return myDict
        
    } // end func
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}   // end extension
