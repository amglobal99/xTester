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
    let testSiteName = "BIKENYC"  // change to "FLICKR" or "GITHUB" or "TYPICODE" if needed
  
  
  
  
  
  @IBAction func getKeyArray(_ sender: AnyObject) {
      
            // Get access to test site details for Row #2
            guard let testSite = Constants.Configuration.TestSite(rawValue: testSiteName) else {
              return
            }
      
           //print("***** getKeyArray... starting *******")
            guard let jsonObj = self.jsonResultObject  else {
                print("getKeyAray: Object is nil.")
                return
            }
        
            // get Section titles array ( key array)
            guard let photoKeyArray =  getSectionTitlesArray(from: jsonObj, key: testSite.key)   else {
                print("@IBAction getKeyArray: photoKeyArray is nil.")
                return
            }
        
            print("\n\n++++++++  @IBAction getKeyArray: Section Titles Array ---> key: \(testSite.key) +++++++++++++++++++++++")
            print(photoKeyArray)
            print("+++++++++++ end @IBAction Section Titles +++++++++++++++++++++\n\n\n")
        
            // get Dictionary
            guard let photoItemsDictionary = getDictionary(from: jsonObj,  for: testSite.key, keyArray: photoKeyArray, dataKey: testSite.dataKey)  else {
                print("@IBAction getKeyArray: PhotoItemsDictionary is nil.")
                return
            }
            
            print("\n\n+++++++++  @IBAction Dictonary: Key: \(testSite.key)  DataKey: \(testSite.dataKey) +++++++++++++++++++++++")
            print(photoItemsDictionary)
            print("+++++++++++++++++  end @IBAction Dictionary +++++++++++++++++++++\n\n\n")
        
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
      
        guard let testSite = Constants.Configuration.TestSite(rawValue: "BIKENYC") else {
          //guard let testSite = Constants.Configuration.TestSite(rawValue: "GITHUB") else {
            //guard let testSite = Constants.Configuration.TestSite(rawValue: "TYPICODE") else {
           // guard let testSite = Constants.Configuration.TestSite(rawValue: "FLICKR") else {
                  return
        }
      
      
          // ********  Completion Handler *************
          let completionHandler: (Result<JSON>) -> Void  =
              { [weak self] result in
                  guard let strongSelf = self else {
                    return
                  }
                
                 // strongSelf.jsonResultObject = result.value!    ( not sure if we need the force unwrapping)
                strongSelf.jsonResultObject = result.value   // set the value for local variable
                
                  print("\n\n\n ++++++++ Fifth VC: viewDidLoad: JSON Object +++++++++++ ")
                  print(strongSelf.jsonResultObject)
                  print(" ++++++++ Items List end from viewDidLoad  +++++++++++ \n\n\n")
              } // end closure
    
    
    
      // get the URL
      guard let url = getSiteURL(baseURLString: testSite.urlString, method: testSite.method , parameters: testSite.params, apiKey: testSite.apiKey) else {
        return
      }
    
    
      // Get the JSON object ( returns a SwiftyJSON object )
      getJSONObject(for: url, rootPath: testSite.rootPath,   completionHandler: completionHandler)
    
    }  // end viewDidLoad
  
  
  

     

}  // end class
