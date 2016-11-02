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


class FifthViewController: UIViewController, JsonConvertible {

    var jsonResultObject:JSON?
    
    
    
    
    @IBAction func getKeyArray(_ sender: AnyObject) {
        
        print("***** getKeyArray... starting *******")
        if let obj = self.jsonResultObject {
            //print(temp)
            
            //if let  myKeyArray =  getKeyArray(from: obj, for: nil, and: "id")  {
           // if let  myKeyArray =  getKeyArray(from: obj, for: nil, and: "")  {
            //if let  myKeyArray =  getKeyArray(from: obj, for: "stationBeanList", and: "totalDocks")  {
            if let  myKeyArray =  getKeyArray(from: obj, for: "stationBeanList", and: "statusValue")  {
             // if let  myKeyArray =  getKeyArray(from: obj, for: "geonames", and: "countrycode")  {
            
                // convert array to unique elements only
                // print(myKeyArray)
                print("************ Separator *********")
                for i in myKeyArray {
                    print(i)
                }
                
                
                // let's get a Dictionary
                if let myDict = getDictionary(from: obj, root: "stationBeanList", for: "statusValue", keyArray: myKeyArray, dataKey:"availableBikes") {
                    print(myDict)
                } else {
                    print("Dictionary not ok")
                }
                
                
                print("last step")
                
                
                
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
        let todoEndpoint :String = "http://citibikenyc.com/stations/json"
       // let todoEndpoint :String = "http://api.geonames.org/citiesJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=demo"
       
        
        
        // ********  This is where the action happens **********************************
        let completionHandler: (Result<JSON>) -> Void  =
            { result in
                self.jsonResultObject = result.value!
                //print("========= Items ist++++++++ ")
                //if let jsObj = self.jsonResultObject {
                  //  print(jsObj)
               // }
            } // end closure
            
        
        //  Call the generic method to get a SwiftyJSON object
        getJSONObject(for: todoEndpoint, completionHandler: completionHandler)

        print("finished viewDidLoad")
        
        
    }  // end viewDidLoad
    
    
        
     

}  // end class
