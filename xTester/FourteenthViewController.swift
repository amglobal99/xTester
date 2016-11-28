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



/**
 
 COMMENTS:
    As far a sI understand, we will need to do three checks to make sure
    we are handling our web requests correctly.
 
    1. Validate that statusCode is between 200 to 299
    2. Make sure error is nil
    3. Make sure response.result.error is NOT NIL
 
    NOTE: Each Alamofire response result ( response.result) give sus either of these 2 values
        SUCCESS
        FAILURE
 
    From that, we either pull 'response.result.value' or ' response.result.error'
 */









class FourteenthViewController: UIViewController {
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            
            let urlString = "https://jsonplaceholder.typicode.com/todos"
            //let urlString2 = "https://api.flickr.com/services/rest"
            //let urlString2 = "http://citibikenyc.com/stations/json"
            let urlString2 = "http://citibikenyc.com/stations/jack"    // This is just to produce an error
            
            
            
            
            // Request #1
            
            // ====== original code ============
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
            /**
                Here, I will show you ow to do 3 checks to make sure youa re handling 
                the response correctly.
                1. We validate that statusCode is between 200 to 299 ( these are HTTP success codes)
                2. Check that response.result.error IS NIL
                3. check that response.result.value is NOT NIL
            */
            
            Alamofire.request(urlString2)
                .validate()  // this is check #1
                .responseJSON
                { response in
                
                        // check #2
                        guard response.result.error == nil else {
                            print("+++++++ Response RESULT ++++++++")
                            print("Our Result: \(response.result) ")
                            print("+++++++++++++++++++++++++++++++++")
                            print("Our Error: \(response.result.error!) ")
                            return
                        }
                    
                        // check #3
                        guard response.result.value !=  nil else {
                            print("Looks like we have no data." )
                            return
                         }
                    
                    print(" +++++++++++++++++++ Entire RESPONSE ++++++++++++++++++++++++++++++")
                    debugPrint(response)   // This prints output for data, response, result  value
                    print("\n\n+++++++++++++++++++  end Entire Response +++++++++++++++++++++++++")
    
            }  // end closure

            
        } // end func
        
    
    
    
    
}  // end class

