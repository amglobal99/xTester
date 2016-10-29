//
//  FifthViewController.swift
//  xTester
//
//  Created by Dad on 10/7/16.
//  Copyright © 2016 Natsys. All rights reserved.
//



import Foundation
import UIKit

class FifthViewController: UIViewController, Utils {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
       
        
        
        // Thos is where we will play with our Asynchronous Requests
        
        // Set up the URL request
       // let  todoEndpoint   : String = "https://jsonplaceholder.typicode.com/todos/1"
       let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos"
        //let todoEndpoint :String = "https://api.github.com/users/amglobal99/repos"
        
        
        
        
        
        
        /*
        
        guard let url = URL(string: todoEndpoint)  else {
            print("Error: cannot create URL")
            return
        }
        
        
        let urlRequest = URLRequest(url: url)
        
        // set up the session. There are two ways of doing this
        // Option 1
        //let config = URLSessionConfiguration.default
        //let session = URLSession(configuration: config)
        
        // second option .... single line
        let session = URLSession.shared
        
        
        // This is our start time
        let start: Date = Date()
        
        
        // make the request
        let task = session.dataTask(with: urlRequest, completionHandler:
            
            // Response is the header info returned by server
            // data is the actual JSON data
            
            { (data, response, error) in
                // do stuff with response, data & error here
                
                if (error != nil) {
                    print("This is an error: \(error) " )
                }
                
                
                // let's print the time it took to get this ASYNCHRONOUS data
                let  seconds: Double = self.timeDiff(start)
                
                
                
                NSLog("It took \(seconds) seconds to process this request")
                
                // First, let's print the raw Response
                NSLog("Full Response From Server: \n \(response!)  " )
                
                
                // Now let's parse the JSON for data that was returned
                
                if data != nil {
                    print("Yes ... we do have JSON data")
                    
                            /*
                             // This code will print the pure String for JSON data
                             if let jsonString = String(data: data!, encoding: String.Encoding.utf8) {
                                print("JSON Data: \n \(jsonString)")
                             }
                        */
                    
                    
                            // Let's parse our JSON
                            if let jsonData =  data {
                                
                                    do {
                                        let object = try JSONSerialization.jsonObject(with: jsonData, options: [])
                                       // let object = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
                                        
                                        print(object)
                                
                                        
                                        
                                        // This is where we will parse json into a Dictionary .. TO BE WORKED ON  10/17/2016
                                        /*
                                        if let dictionary = object as? [String: AnyObject] {
                                            print("in the lop ..")
                                            
                                            // Let's create s Dictonary from JSOn object
                                            var dict =  self.getDictionaryFromJson(rootElement:"users",
                                                                                                     categoryElement: "section",
                                                                                                     valueElement: "name",
                                                                                                     jsonObject: dictionary  )!
                                            print(dict)
                                        } // let dictionary =
                                      */
                                        
                                        
                                        
                                        /*
                                        guard let
                                            jsonDictionary = jsonObject as? [AnyHashable: Any],
                                            //items = jsonDictionary["items"] as? [String:AnyObject],
                                            let items = jsonDictionary["photos"] as? [String:AnyObject],
                                            //itemsArray = items["item"] as? [ [String:AnyObject]]
                                            let itemsArray = items["photo"] as? [ [String:AnyObject]]
                                            
                                            else {
                                                print("        itemsFromJSONData: An error found in guard block")
                                         
                                        }
 
                                        
                                        */
                                        
                                        
                                    guard
                                            let  jsonDictionary = object as? [AnyHashable:Any]
                                        
                                             // ...... Complete this section
                                            // ......................
                                        
                                        
                                        
                                        
                                        
                                        
                                     else {
                                         print("error in getting json")
                                          return
                                    }
                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                       
                                    } catch let error {
                                        print("Error ceating JOSN object \(error)")
                                    }  // end do-catch
                                
                            }// jsonData =  data
                    
                    
                    } // data != nil
                
                
            }  // end closure
            
        )  // task = session.dataTask







        
        // We will now send the actual request.
        // Remember : At this point the tAsk is in a suspended state ( Tasks are initially in Suspended state)
        
        NSLog("Now activating the Task")
        
        // Task is created in Suspended state
        task.resume()
        
        
        // While TASk is running in background on different THread, control will come here
        NSLog("My task is still running in the background")
        
    */
         
         
         
       
         let jsObject = getJSONObject(for: todoEndpoint) 
           // print(jsObject)
        
        
        
         
         
        
    }  // end method
    
    
        
        
        
        
        
        
        
    

}  // end class
