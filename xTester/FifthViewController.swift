//
//  FifthViewController.swift
//  xTester
//
//  Created by Dad on 10/7/16.
//  Copyright © 2016 Natsys. All rights reserved.
//



import Foundation
import UIKit
import SwiftyJSON
import Alamofire



class FifthViewController: UIViewController, JsonConvertible, Utils {

    var jsonResultObject:JSON?
    let baseURLString = "https://api.flickr.com/services/rest"
    let APIKey = "a6d819499131071f158fd740860a5a88"
    let method = "flickr.photos.getRecent"
    
    fileprivate static let dateFormatter: DateFormatter = {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    

    
    enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
    }
    
    
    
    @IBAction func getKeyArray(_ sender: AnyObject) {
        
        print("***** getKeyArray... starting *******")
        
        if let obj = self.jsonResultObject {
            
            //if let  myKeyArray =  getKeyArray(from: obj, for: nil, and: "id")  {
            //if let  myKeyArray =  getKeyArray(from: obj, for: "stationBeanList", and: "totalDocks")  {
            //if let  myKeyArray =  getKeyArray(from: obj, for: "stationBeanList", and: "statusValue")  {   // This is for CityBikesNYC
                if let  myKeyArray =  getKeyArray(from: obj, for: "photo", and: "server")  {   // This is for CityBikesNYC
                    
                
                
                            /*
                print("************ Separator *********")
                for i in myKeyArray {
                    print(i)
                }
                */
                
                // let's get a Dictionary
               // if let myDict = getDictionary(from: obj, root: "stationBeanList", for: "statusValue", keyArray: myKeyArray, dataKey:"stationName") {
              //      if let myDict = getDictionary(from: obj, root: "stationBeanList", for: "statusValue", keyArray: myKeyArray, dataKey:"availableDocks") {
                        
                if let myDict = getDictionary(from: obj, root: "stationBeanList", for: "server", keyArray: myKeyArray, dataKey:"id") {
                            
                            
        
                        
                        
                        
                        
                    print(myDict)
                } else {
                    print("Dictionary not ok")
                }
            } else {
                print("Oops !! -- A nil array was returned.")
            }
        } else {
            print("Ooops .... A nil JSON object was returned.")
        }
        
    } // end action
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // This is where we will play with our Asynchronous Requests
        
        // let  todoEndpoint   : String = "https://jsonplaceholder.typicode.com/todos/1"
        //let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos"
        // let todoEndpoint :String = "https://api.github.com/users/amglobal99/repos"
        //let todoEndpoint :String = "http://citibikenyc.com/stations/json"
       // let todoEndpoint :String = "http://api.geonames.org/citiesJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=demo"
       //let todoEndpoint = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=8&q=http%3A%2F%2Fnews.google.com%2Fnews%3Foutput%3Drss"
        let todoEndpoint = "https://api.flickr.com/services/rest"
        
        
        
        let params = ["extras":"url_h,date_taken"]
         let url = getSiteURL(baseURLString: todoEndpoint, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: APIKey)
      
        // ********  This is where the action happens **********************************
        let completionHandler: (Result<JSON>) -> Void  =
            { result in
                self.jsonResultObject = result.value!
                
                print("========= Items List ++++++++ ")
                if let jsObj = self.jsonResultObject {
                   print(jsObj)
                }
        
            } // end closure
            
        
        //  Call the generic method to get a SwiftyJSON object
        getJSONObject(for: url, completionHandler: completionHandler)

        print("finished viewDidLoad")
        
        
    }  // end viewDidLoad
    
    
        
     

}  // end class
