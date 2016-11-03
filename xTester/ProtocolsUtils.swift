//
//  ProtocolUtils.swift
//  xTester
//
//  Created by Dad on 10/10/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

// We will create a librray of commonly used function here


import Foundation
import UIKit
import BRYXBanner
import Alamofire



// MARK: Protocols

protocol Utils {}   // This protocol contains common utility functions





// MARK: - Extensions


// MARK: - Extensions Utils

extension Utils {
    
    
    
    
    // This is a simple test method
    func climb() -> Void {
        print("I am climbing .....")
    }
    
    
    
    
    //MARK: - Date/ Time Section
    
    
    // ***********************************************
    // Function computes difference between two Dates
    //
    // ************************************************
    
    func timeDiff(_ date1: Date) -> Double {
        let  date2: Date = Date()
        return date2.timeIntervalSince(date1)
        
    }
    
    
    
    //MARK: - Banner Related
    func showBanner(title:String, subtitle:String, image: UIImage?, bkColor: UIColor) {
        let banner: Banner? = Banner(title: title, subtitle: subtitle, image: image, backgroundColor: bkColor)
        banner?.dismissesOnSwipe = true
        banner?.show(duration: nil)
    }
    
    
    
    
    
    
    
    
    // MARK: Array related
    
    func convertArray(toString arr:[String]) -> String? {
        return arr.joined(separator: ",")
    }
    
    
    
    
    
    
    
    // MARK:  URL Related
    
     func getSiteURL(baseURLString:String, method: String, parameters: [String:String]?, apiKey:String? ) -> URL {
        
        var components = URLComponents(string: baseURLString )!
        var queryItems = [URLQueryItem]()
        
        let baseParams  = [
            "method": method,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": apiKey
        ]
        
        
        for(key,value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        
        if let additionalParams = parameters{
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value )
                queryItems.append(item)
            } //end for loop
        } //end if
        
        components.queryItems = queryItems
        return components.url!
        
    } //end method
    
    
    
    
    
    
    
    
    
    
    
    
}  // end extension


















