//
//  Utils.swift
//  xTester
//
//  Created by Dad on 10/10/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

// We will create a librray of commonly used function here



import Foundation
import UIKit



// create empty protocol
protocol Utils {

}


// Implement functionality here
extension Utils {
    
    // This is a simple test method
    func climb() -> Void {
        print("I am climbing .....")
    }
    
    
    
    
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
    
    
    
    
    
    
    
    
    //  ********************** Date / Time Section **********************************
    
    
    // ***********************************************
    // Function computes difference between two Dates
    //
    // ************************************************
    
    func timeDiff(_ date1: Date) -> Double {
        let  date2: Date = Date()
        return date2.timeIntervalSince(date1)
        
    }
    
    
    
    
    
    
    
    
}  // end extension
