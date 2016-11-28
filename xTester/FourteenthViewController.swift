//
//  FourteenthViewController.swift
//  xTester
//
//  Created by Dad on 10/18/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import Foundation
import UIKit
import Alamofire

/*
 
 // Alamofire 5 provides 5 different options to handle a response
 
    1. Unserialized
    2. Serialized into Data
    3. Serialized into String
    4. Seralized into JSON
    5. Serialized into PropertyList ??
 
 
 
// Response Handler - Unserialized Response
func response(
    queue: DispatchQueue?,
    completionHandler: @escaping (DefaultDataResponse) -> Void)
    -> Self

// Response Data Handler - Serialized into Data
func responseData(
    queue: DispatchQueue?,
    completionHandler: @escaping (DataResponse<Data>) -> Void)
    -> Self

// Response String Handler - Serialized into String
func responseString(
    queue: DispatchQueue?,
    encoding: String.Encoding?,
    completionHandler: @escaping (DataResponse<String>) -> Void)
    -> Self

// Response JSON Handler - Serialized into Any
func responseJSON(
    queue: DispatchQueue?,
    completionHandler: @escaping (DataResponse<Any>) -> Void)
    -> Self

// Response PropertyList (plist) Handler - Serialized into Any
func responsePropertyList(
    queue: DispatchQueue?,
    completionHandler: @escaping (DataResponse<Any>) -> Void))
-> Self


*/








class FourteenthViewController: UIViewController {
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            
            let urlString = "https://jsonplaceholder.typicode.com/todos"
            //let urlString2 = "https://api.flickr.com/services/rest"
            let urlString2 = "http://citibikenyc.com/stations/json"
            
            
            // Request #1
            
            Alamofire.request(urlString).responseJSON {
                
                response in
                    //debugPrint(response)   // This prints output for data, response, result  values
                
                        print("\n\n++++++++++++++++++ Response Data +++++++++++++++++++++")
                        print(response.data)
                        print("\n\n++++++++++++++++++ Response Response +++++++++++++++++++++")
                        print(response.response) // HTTP URL response
                        print("\n\n++++++++++++++++++ Response Result +++++++++++++++++++++")
                        print(response.result)   // result of response serialization
                
                
                
                    if let JSON = response.result.value {
                        print("\n\n +++++++++++++++++ Response Value (JSON) +++++++++++++++++++++++++++++++")
                        print("JSON: \(JSON)")
                        print(" +++++++++++++++++ end JSON ++++++++++++++++++++++++++++")
                    }
                
                }  // end closure
           
            
            
            
            
            
            
            
            // Request # 2
            
            Alamofire.request(urlString2).response {
                response in
                print(" +++++++++++++++++++ Entire RESPONSE ++++++++++++++++++++++++++++++")
                    debugPrint(response)   // This prints output for data, response, result  value
                print("\n\n+++++++++++++++++++  end Entire Response +++++++++++++++++++++++++")
            }  // end closure
            
            
        } // end func
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        

        
        
        
        

    
    
    
    
}  // end class

