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
import SwiftyJSON

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
    
    
    
    let urlString = "https://jsonplaceholder.typicode.com/todos"
    //let urlString2 = "https://api.flickr.com/services/rest"
    let urlString2 = "http://citibikenyc.com/stations/json"
    //let urlString2 = "http://citibikenyc.com/stations/jack"    // This is just to produce an error
    
    
    
    
    
    
    @IBAction func getSimple(_ sender: AnyObject) {
        
         // Request #1
         Alamofire.request(urlString)
            .responseJSON
            { response in
                
                
                /*
                 
                 // THis is Working code. Uncomment for testing
                 
                 //debugPrint(response)   // This prints output for data, response, result  values
                 
                 
                 print("\n\n++++++++++++++++++ Response Data +++++++++++++++++++++")
                 print(response.data)
                 print("\n\n++++++++++++++++++ Response Response +++++++++++++++++++++")
                 print(response.response) // HTTP URL response
                 print("\n\n++++++++++++++++++ Response Result +++++++++++++++++++++")
                 print(response.result)   // result of response serialization
                
                 if let json = response.result.value {
                     print("\n\n +++++++++++++++++ Response Value (JSON) +++++++++++++++++++++++++++++++")
                     print("JSON: \(json)")
                     print(" +++++++++++++++++ end JSON ++++++++++++++++++++++++++++")
                        
                }
                */
                
                
                
                    // Another way of processing the response
                     switch response.result {
                         case .success(let value):
                             let jsonObject = JSON(value)
                             print("+++++++++++++++++++++++++++++++++++++++")
                             print("JSON Object: \(jsonObject)")
                        
                        
                            // Each JSON object can be accessed using a for loop
                            // Format is for(index, subJSON) in JSON object
                            // Therefore, first index will be 0, next 1, 2, 3 etc ...
                            // subjson gives us the object at that index
                        
                             for (_, json) in jsonObject {
                                 print("\n-------------- Json Record ---------------")
                                print(json)
                            }
                        
                         case .failure(let error):
                             print(error)
                     }
                    
                    
                
                
                
                
                
             
        
         }  // end closure
        
        
    } // end IBAction
    
    
    
    
    
    
    
    
    
    
    @IBAction func getWithValidate(_ sender: AnyObject) {
        
        // Request # 2
        /**
         Here, I will show you ow to do 3 checks to make sure you are handling
         the response correctly.
         1. We validate that statusCode is between 200 to 299 ( these are HTTP success codes)
         2. Check that response.result.error IS NIL
         3. check that response.result.value is NOT NIL
         */
    
         Alamofire.request(urlString2)
         .validate()  // this is check #1
         .responseString
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
        
        
    }



    
    
    @IBAction func getWithParams(_ sender: AnyObject) {
        
        // Request # 3  ..... Create simple HTTP request with custom headers and Parameters
        
        // This is a minor variaton of Request #2
        // What we have done here is to create a HTTPRequest with custom headers and parameters
        // we can also do a POST request
        //
        
        if let url = URL(string: urlString2) {
            let encodedURLRequest: URLRequest?
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            //urlRequest.httpMethod = HTTPMethod.post.rawValue
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            let parameters: Parameters = ["foo": "bar"]
            
            do {
                encodedURLRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
            } catch {
                return
            }
            
            Alamofire.request(encodedURLRequest!)
                .validate()  //check #1. This confirms statusCode is between 200 -299 and content is JSON. Otherwise error
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
                    
            } // end closure
            
        } // end if
        
        
    } // end IBAction
    
    
    
    
    
    @IBAction func getWithErrorCodeCheck(_ sender: AnyObject) {
        
        // This example shows us how to retrieve and check the status code 
        // for a request
        // We are not using validate here.
        
        let urlStr = "http://citibikenyc.com/stations/jack"    // This is just to produce an error
        
    
        Alamofire.request(urlStr)
            .responseString
            { response in
                print("Success: \(response.result.isSuccess)")
                print("Response String: \(response.result.value)")
                var statusCode = response.response?.statusCode
                
                if let error = response.result.error as? AFError {
                    statusCode = error._code // statusCode private
                    switch error {
                            case .invalidURL(let url):
                                print("Invalid URL: \(url) - \(error.localizedDescription)")
                            case .parameterEncodingFailed(let reason):
                                print("Parameter encoding failed: \(error.localizedDescription)")
                                print("Failure Reason: \(reason)")
                            case .multipartEncodingFailed(let reason):
                                print("Multipart encoding failed: \(error.localizedDescription)")
                                print("Failure Reason: \(reason)")
                            case .responseValidationFailed(let reason):
                                print("Response validation failed: \(error.localizedDescription)")
                                print("Failure Reason: \(reason)")
                                
                                switch reason {
                                case .dataFileNil, .dataFileReadFailed:
                                    print("Downloaded file could not be read")
                                case .missingContentType(let acceptableContentTypes):
                                    print("Content Type Missing: \(acceptableContentTypes)")
                                case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                                    print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                                case .unacceptableStatusCode(let code):
                                    print("Response status code was unacceptable: \(code)")
                                    statusCode = code
                                }
                            case .responseSerializationFailed(let reason):
                                print("Response serialization failed: \(error.localizedDescription)")
                                print("Failure Reason: \(reason)")
                                // statusCode = 3840 ???? maybe..
                    }
                    
                    print("Underlying error: \(error.underlyingError)")
                } else if let error = response.result.error as? URLError {
                    print("URLError occurred: \(error)")
                } else {
                    print("Unknown error: \(response.result.error)")
                }
                
                print(statusCode) // the status code
        } // end closure
        
        
        
    } // end IBAction
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func postSimple(_ sender: AnyObject) {
        
        /**
         Let's create a simple POST request
         NOTE:  A POST request should return a status code of 201 for successful request.
         Let's validate that we are getting 201 back
 
        */
        
        print("Starting POST request")
        let todosEndpoint: String = "https://jsonplaceholder.typicode.com/todos"
        guard let todosURL = URL(string: todosEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        var todosUrlRequest = URLRequest(url: todosURL)
        todosUrlRequest.httpMethod = "POST"
        
        // Let's create 2 objects
        let newTodo: [[String: Any]] = [["title": "My First todo", "completed": false, "userId": 1],[ "title": "My Second todo", "completed": false, "userId": 1]   ]
        
        
        let jsonTodo: Data
        do {
            jsonTodo = try JSONSerialization.data(withJSONObject: newTodo, options: [])
            todosUrlRequest.httpBody = jsonTodo
        } catch {
            print("Error: cannot create JSON from todo")
            return
        }
        
        print("Sending Alamofire request")
        Alamofire.request(todosUrlRequest)
            .validate(statusCode: [201] )  // this is check #1 ... Code 201 indicates that Resource was created by POST
            .responseString
            { response in
                // check #2
                guard response.result.error == nil else {
                    print("+++++++ We did not get status Code of 201 back ++++++++++++++++++++++++++")
                    print("Our Error: \(response.result.error!) ")
                    return
                }
                
                print("Result.IsSuccess: \(response.result.isSuccess)")
                print("\n\n+++++++++++++++ Response Result Value +++++++++++++++")
                print("Response String: \(response.result.value!)")
                                print("+++++++++++++++++++++++++++++++++++++++++++++++++++++")
                
                print("\n\n++++++++++++++ Status Code ++++++++++++++")
                let statusCode = response.response?.statusCode
                print("Our Status Code: \(statusCode!)")
                print("+++++++++++++++++++++++++++++++++++++++++++++++++++++")
                
                
                print("\n\n +++++++++++++++++++ Entire RESPONSE ++++++++++++++++++++++++++++++")
                debugPrint(response)   // This prints output for data, response, result  value
                print("\n\n+++++++++++++++++++  end Entire Response +++++++++++++++++++++++++")
                
        }  // end closure
       
        
    }  // end IBAction
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func postComplex(_ sender: AnyObject) {
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func postAuthenticateSimple(_ sender: AnyObject) {
    
        let user = "user"
        //let user = "jack"
        let password = "password"
        let credential = URLCredential(user: user, password: password, persistence: .forSession)
        let loginString = String(format: "%@:%@", user, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        let urlString: String = "https://httpbin.org/basic-auth/\(user)/\(password)"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        Alamofire.request(request)
            .responseString  { response in
                debugPrint(response)
        }
        
    } // end func
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
    
        } // end func viewDidLoad







}  // end class

