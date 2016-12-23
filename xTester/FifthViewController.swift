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
    
    //  Enable one of these to test
    let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue
    //let baseURLString  = Constants.Configuration.jsonTestUrl.bikeNYC.rawValue
    //let baseURLString  = Constants.Configuration.jsonTestUrl.google.rawValue
    //let baseURLString  = Constants.Configuration.jsonTestUrl.gitHub.rawValue

  
  
  // UNCOMMent appropriate section as needed
  
  let apiKey = Constants.FlickrApi.apiKey
  let method = Constants.FlickrApi.method
  let key  = Constants.FlickrApi.key
  let rootPath = Constants.FlickrApi.rootPath
  let dataKey = Constants.FlickrApi.dataKey
  let params = Constants.FlickrApi.params
  
  
  
  /*
  let apiKey = Constants.BikeNycApi.apiKey
  let method = Constants.BikeNycApi.method
  let key  = Constants.BikeNycApi.key
  let rootPath = Constants.BikeNycApi.rootPath
  let dataKey = Constants.BikeNycApi.dataKey
  let params = Constants.BikeNycApi.params
  
  */
  
  
    
    @IBAction func getKeyArray(_ sender: AnyObject) {
        
           //print("***** getKeyArray... starting *******")
            guard let jsonObj = self.jsonResultObject  else {
                print("getKeyAray: Objcect is nil.")
                return
            }
        
            // get Section titles array ( key array)
            guard let photoKeyArray =  getSectionTitlesArray(from: jsonObj, key: key)   else {
                print("@IBAction getKeyArray: photoKeyArray is nil.")
                return
            }
        
            print("+++++++++++++++++  @IBAction getKeyArray: Section Titles Array ---> key: \(key) +++++++++++++++++++++++")
            print(photoKeyArray)
            print("+++++++++++++++++  end @IBAction Section Titles +++++++++++++++++++++")
        
            // get Dictionary
            guard let photoItemsDictionary = getDictionary(from: jsonObj,  for: key, keyArray: photoKeyArray, dataKey: dataKey)  else {
                print("@IBAction getKeyArray: PhotoItemsDictionary is nil.")
                return
            }
            
            print("+++++++++++++++++  @IBAction Dictonary: Key: \(key)  DataKey: \(dataKey) +++++++++++++++++++++++")
            print(photoItemsDictionary)
            print("+++++++++++++++++  end @IBAction Dictionary +++++++++++++++++++++")
        
    } // end action
    
    
    
    
  @IBAction func parseLocalJson(_ sender: AnyObject) {
    
       // if let path = Bundle.main.path(forResource: "names2", ofType: "json") {
       // if let path = Bundle.main.path(forResource: "NestedNames", ofType: "json") {
       if let path = Bundle.main.path(forResource: "productList", ofType: "json") {
       
           do {
               let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
               let jsonObj = JSON(data: data)
               if jsonObj != JSON.null {
               print("jsonData:\(jsonObj)")
                
               let arr:[String] = [""]
               print(arr.count)
               
               print("++++++++++++++++++++++ filter+++++++++")
               let prodObj = jsonObj["results"][0]["products"]
               print(prodObj)
               print("Length is : \(prodObj.count)  ")
              
               print("+++++++++++++++++++++++++++++++++++++")
               let salePrice = prodObj[0]["prices"]["sale"]
               print(salePrice)
               
               let imageType = prodObj[0]["images"][1]["type"]
               print(imageType)
               
               
               } else {
               print("Could not get json from file, make sure that file contains valid json.")
               }
           } catch let error {
              print(error.localizedDescription)
           }
       } else {
          print("Invalid filename/path.")
       }
       
    
  } // end IBAction
  
  
  
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
            // ********  Completion Handler *************
            let completionHandler: (Result<JSON>) -> Void  =
                { [weak self] result in
                    guard let strongSelf = self else {
                      return
                    }
                    strongSelf.jsonResultObject = result.value!   // set the value for local variable
                    print(" ++++++++ Fifth VC: viewDidLoad: JSON Object +++++++++++ ")
                     print(strongSelf.jsonResultObject)
                    print(" ++++++++ Items List end from viewDidLoad  +++++++++++ ")
                } // end closure
      
        
        // Create a Async (Alamofire) request to get SwiftyJSON data
      // If you change URL to test, also make required chnage for constants in GlobalConstants.swift file
        let url = getSiteURL(baseURLString: baseURLString, method: method , parameters: params, apiKey: apiKey)
      
        getJSONObject(for: url, rootPath: rootPath,   completionHandler: completionHandler)  // get a SwiftyJSON object
    }  // end viewDidLoad
    
    
        
     

}  // end class
