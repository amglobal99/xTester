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


    /*
    // ***********************************************
    // Function computes difference between two Dates
    //
    // ************************************************
    
    func timeDiff(date1: Date) -> Double {
        let  date2: Date = Date()
        return date2.timeIntervalSince(date1)
        
    }
    
    */
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Thos is where we will play with our Asynchronous Requests
        
        // Set up the URL request
        //let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos"
        
        guard let url = URL(string: todoEndpoint)  else {
            print("Error: cannot create URL")
            return
        }
        
        
        let urlRequest = URLRequest(url: url)
        
        // set up the session. There are two ways of doing this
        //let config = URLSessionConfiguration.default
        //let session = URLSession(configuration: config)
        
        // second option .... single line
        let session = URLSession.shared
        
        
        // This is our start time
        let start: Date = Date()
        
        
        // make the request
        let task = session.dataTask(with: urlRequest, completionHandler:
            
            // Response is the headres info returned by server
            // data is the actual JSON data
            
            { (data, response, error) in
                // do stuff with response, data & error here
                
                if (error != nil) {
                    print("This is an error: \(error) " )
                }
                
                
                // let's print the time it took to get this ASYNCHRONOUS data
                let  date2: Date = Date()
                // let  seconds  = date2.timeIntervalSince(start)
                let  seconds: Double = self.timeDiff(date1: start)
                
                
                
                
                NSLog("It took \(seconds) seconds to process this request")
                
                // First, let's print the raw Response
                NSLog("Full Response From Server: \n \(response!)  " )
                
                
                // Now let's parse the JSON for data that was returned
                if let jsonData  = data {
                    print("Yes ... we do have JSON data")
                    
                    /*
                     // This code will print the pure String for JSON data
                     if let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) {
                     print("JSON Data: \n \(jsonString)")
                     }
                     */
                    
                    // Let's parse our JSOn
                    if let jsonData =  data {
                        do {
                            let jsonObject:Any = try JSONSerialization.jsonObject(with: jsonData, options: [])
                            print(jsonObject)
                            
                            /*
                            // Let's create s Dictonary from JSOn object
                            var dict:[String:[String]] =  self.getDictionaryFromJson(rootElement:"users",categoryElement: "section", valueElement: "name", jsonObject: dictionary)!
                            print(dict)

                            */
                            
                            
                            
                            
                            
                            
                            
                        } catch let error {
                            print("Error ceating JOSN object \(error)")
                        }  // end do
                    }// end if
                    
                    
                } // end if jsonData =  data
                
                
            }
        )
        
        
        // We will now send the actual request.
        // Remember : At this point the tAsk is in a suspended state ( Tasks are initially in Suspended state)
        
        NSLog("Now activating the Task")
        
        // Task is created in Suspended state
        task.resume()
        
        
        // While TASk is running in background on different THread, control will come here
        NSLog("My task is still running in the background")
        
    
        
    }  // end method
    
    

    

}  // end class
