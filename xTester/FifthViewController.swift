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
    
    // Pull URl strings from an enum in GlobalConstants.swift
    
    //let baseURLString  = Constants.Configuration.jsonTestUrl.jsonPlaceholder2.rawValue
    //let baseURLString  = Constants.Configuration.jsonTestUrl.google.rawValue
    //let baseURLString  = Constants.Configuration.jsonTestUrl.gitHub.rawValue
    //let baseURLString  = Constants.Configuration.jsonTestUrl.bikeNYC.rawValue
    let baseURLString  = Constants.Configuration.jsonTestUrl.flickr.rawValue

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
            //let rootPath = ["photos","photo"]
           
            guard let obj = self.jsonResultObject  else {
                print("obj was null...")
                return
            }
        
            // get key array
            guard let myKeyArray =  getKeyArray(from: obj, key: "server")   else {
                print("keyArray was null ...")
                return
            }
        
            // get Dictionary
            guard let myDict = getDictionary(from: obj,  for: "server", keyArray: myKeyArray, dataKey:"id") else {
            //    guard let myDict = getDictionary(from: obj,  for: "server", keyArray: myKeyArray, dataKey:"id") else {
                print("myDict was null..")
                return
            }
        
            print(myDict)
        
            guard let dictValues = getDictionaryValues(fromDictionary: myDict, for: "5694") else {
                print("dictValues ws null....")
                return
            }
        
                            print(" ########  Values from Dict for item 5522 ##########")
                            print(dictValues)
                            print("####################  end Dict values ############")
        
    } // end action
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // This is where we will play with our Asynchronous Requests
            let params = ["extras":"url_h,date_taken"]
            let url = getSiteURL(baseURLString: baseURLString, method: Method.RecentPhotos.rawValue, parameters: params, apiKey: APIKey)  // Flickr
           // let url = getSiteURL(baseURLString: baseURLString, method: nil, parameters: nil, apiKey: nil) // Google
           //let url = getSiteURL(baseURLString: baseURLString, method: nil, parameters: nil, apiKey: nil) // jsonplaceholder

        
         print("got url ....")
      
    
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
        getJSONObject(for: url, rootPath: ["photos","photo"], completionHandler: completionHandler)  // Flickr
        //getJSONObject(for: url, rootPath: nil, completionHandler: completionHandler)
    
        
        print("finished viewDidLoad")
        
    }  // end viewDidLoad
    
    
        
     

}  // end class
