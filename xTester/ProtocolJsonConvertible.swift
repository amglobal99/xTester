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





protocol JsonConvertible {}


extension JsonConvertible  {
    
    
    
    //  ******************  JSON Section   **************************************
    
    // THis function creates a Dictionary from a JSON object
    // For example, let's say you have a JSON object with many attributes
    // You want to retrieve values and group them into sections.
    // Example: I have an atribute called "section" with values such as Technology, Science, Business
    // My JSon object has name field with values say John, MAry, Carla etc
    // I want a Dictionary with key as say "Science" and value array as ["MAry","Bob","Kelly.....]
    
    /*
     func getDictionaryFromJson(rootElement:String,
     categoryElement:String,
     valueElement:String,
     jsonObject: [String: AnyObject]) -> [String:[String]]?  {
     
     var finalDictionary = [String:[String]]()
     
     // get array of keys
     let keyArray:[String] = getKeyArrayFromJSON(rootElement: rootElement, key: categoryElement, jsonObject: jsonObject)!
     
     //print(keyArray)
     //print ("key1: \(categoryElement) \n key2: \(valueElement)")
     
     var tempArr = [String]()   // temporary storage
     
     for item in keyArray {  // Process each section
     guard
     let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
     else {
     return nil
     }
     
     // process all items and check for items that match item
     for obj in jsObject  {
     let  val1 = obj[categoryElement] as? String
     let  val2 = obj[valueElement] as? String
     if val1 == item {
     tempArr.append(val2!)
     }
     }  // for obj
     
     
     // Now add an entry to our final Dictonary
     finalDictionary.updateValue(tempArr, forKey: item)
     
     // clear array
     tempArr.removeAll()
     
     }// item in keyArray
     
     // Return the final Dictionary
     return finalDictionary
     
     }  // end funtion
     
     
     
     
     
     
     
     func getDictionaryFromJson(_ rootElement:String,
     categoryElement:String,
     valueElement:String,
     jsonObject: [String: AnyObject]) -> [String:[String]]?  {
     
     var finalDictionary = [String:[String]]()
     
     // get array of keys
     let keyArray:[String] = getKeyArrayFromJSON(rootElement, key: categoryElement, jsonObject: jsonObject)!
     
     //print(keyArray)
     //print ("key1: \(categoryElement) \n key2: \(valueElement)")
     
     var tempArr = [String]()   // temporary storage
     
     for item in keyArray {  // Process each section
     
     guard
     let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
     else {
     return nil
     }
     
     // process all items and check for items that match item
     for obj in jsObject  {
     let  val1 = obj[categoryElement] as? String
     let  val2 = obj[valueElement] as? String
     if val1 == item {
     tempArr.append(val2!)
     }
     }  // for obj
     
     
     // Now add an entry to our final Dictonary
     finalDictionary.updateValue(tempArr, forKey: item)
     
     // clear array
     tempArr.removeAll()
     
     }// item in keyArray
     
     // Return the final Dictionary
     return finalDictionary
     
     }  // end funtion
     
     
     
     
     
     
     
     
     
     
     
     
     
     // This is a helper function.
     
     func getKeyArrayFromJSON(_ rootElement:String,
     key:String,
     jsonObject: [String: AnyObject]) -> [String]? {
     
     var tempArray = [String]()   // create empty array
     guard
     let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
     else {
     //print("is nil...")
     return nil
     }
     
     for obj in jsObject {
     guard
     let key = obj[key] as? String
     else {
     break
     }
     tempArray.append(key)
     }  // for obj
     
     
     // return array
     return Array(Set(tempArray)  )
     
     }  // end function
     
     
     
     
     // **************************** end JSON section ************************************************************
     
     
     
     */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /// *******************************************  NEW JSON xection ********************************
    //
    //
    //
    
    
    /*
     func getDictionaryFromJson(rootElement:String,
     categoryElement:String,
     valueElement:String,
     jsonObject: [String: AnyObject]) -> [String:[String]]?  {
     
     var finalDictionary = [String:[String]]()
     
     // get array of keys
     let keyArray:[String] = getKeyArrayFromJSON(rootElement: rootElement, key: categoryElement, jsonObject: jsonObject)!
     
     //print(keyArray)
     //print ("key1: \(categoryElement) \n key2: \(valueElement)")
     
     var tempArr = [String]()   // temporary storage
     
     for item in keyArray {  // Process each section
     guard
     let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
     else {
     return nil
     }
     
     // process all items and check for items that match item
     for obj in jsObject  {
     let  val1 = obj[categoryElement] as? String
     let  val2 = obj[valueElement] as? String
     if val1 == item {
     tempArr.append(val2!)
     }
     }  // for obj
     
     
     // Now add an entry to our final Dictonary
     finalDictionary.updateValue(tempArr, forKey: item)
     
     // clear array
     tempArr.removeAll()
     
     }// item in keyArray
     
     // Return the final Dictionary
     return finalDictionary
     
     }  // end funtion
     
     
     */
    
    
    
    
    func getDictionaryFromJson(_ rootElement:String,
                               categoryElement:String,
                               valueElement:String,
                               jsonObject: [String: AnyObject]) -> [String:[String]]?  {
        
        var finalDictionary = [String:[String]]()
        
        // get array of keys
        let keyArray:[String] = getKeyArrayFromJSON(rootElement, key: categoryElement, jsonObject: jsonObject)!
        
        //print(keyArray)
        //print ("key1: \(categoryElement) \n key2: \(valueElement)")
        
        var tempArr = [String]()   // temporary storage
        
        for item in keyArray {  // Process each section
            
            guard
                let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
                else {
                    return nil
            }
            
            // process all items and check for items that match item
            for obj in jsObject  {
                let  val1 = obj[categoryElement] as? String
                let  val2 = obj[valueElement] as? String
                if val1 == item {
                    tempArr.append(val2!)
                }
            }  // for obj
            
            
            // Now add an entry to our final Dictonary
            finalDictionary.updateValue(tempArr, forKey: item)
            
            // clear array
            tempArr.removeAll()
            
        }// item in keyArray
        
        // Return the final Dictionary
        return finalDictionary
        
    }  // end funtion
    
    
    
    
    
    
    
    
    
    
    
    
    
    // This is a helper function. Given some JSON object, we specify a key , say for example "name".
    // this function retrievs an aray of all name attributes
    
    func getKeyArrayFromJSON(_ rootElement:String,   key:String, jsonObject: [String: AnyObject]) -> [String]? {
        
        var tempArray = [String]()   // create empty array
        guard
            let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
        else {
            print("getKeyArrayFromJOSN : got a nil...")
            return nil
        }
        
        for obj in jsObject {
            guard let key = obj[key] as? String
            else {
                break
            }
            tempArray.append(key)
        }
        return Array(Set(tempArray)  )    // return array
        
    }  // end function
    
    
    
    
    
    
    func getJSONObject (for url:String) -> Any? {
        print("getJSONObject ... starting ")
        var object:Any?
        guard let url = URL(string: url)  else {
            return nil
        }
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        // make the request
        let task = session.dataTask(with: urlRequest, completionHandler:
            { (data, response, error) in
                if (error != nil) {
                    print("This is an error: \(error) " )
                    return
                }
                //NSLog("Full Response From Server: \n \(response!)  " )
                
                if data != nil {
                    // print("Yes ... we do have JSON data")
                    if let jsonData =  data {      // Let's parse our JSON
                        do {
                            object = try JSONSerialization.jsonObject(with: jsonData, options: [])
                            // let object = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
                            if object != nil {
                                print(object!)
                            }
                        } catch let error {
                            print("Error ceating JOSN object \(error)")
                            return
                        }
                    }// jsonData =  data
                } // data != nil
            }  // end closure
            
        )  // task = session.dataTask
        
        
        // Task is created in Suspended state
        task.resume()
        
        return object
        
    }  // end func
    
    
    
    
    
    /*
    
    func getJSONObjectAlamofire(for url:String) -> Void {
        
        print("getJSONObjectAlamofire ... starting ")
        guard let url = URL(string: url)  else {
            return
        }
        let urlRequest = URLRequest(url: url)
        
        _ =  Alamofire.request(urlRequest).responseJSON
            { (response) -> Void  in
                    guard response.result.error == nil else {   // got an error
                        print(response.result.error!)
                        return
                    }
        
                    guard response.result.value != nil else {
                        return
                    }
                
                    let json:JSON  = JSON(response.result.value!)
                    print(".... Printing jOSN: \n ***************************** ")
                    print(json)
        }  // end Alamofire request
      
        
        
        
    } // end func getJSONObjectAlamofire
    
    */
    
    
    
    
    // ************************ SwiftyJSOn Section **************************************
    
    
   
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
    // ****************************************************************************************
    
    func getKeyArray(from jsonObject:JSON, for key1:String?, and key2:String) -> [String]? {
        print("getKeyArray from Protool.... started")
        var arrayNames:[String] = []
        
        if let myKey1 = key1 {
            for object in  jsonObject[myKey1].arrayValue {
                let name = object[key2].stringValue
                //let name = object[key2].rawValue
                arrayNames.append(name)
            }
        } else {
                for (_, object) in jsonObject {
                    let name = object[key2].stringValue
                    arrayNames.append(name)
                }
        }
        
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
        //print(arrayToProcess.count)
        //print(arrayToProcess)
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
