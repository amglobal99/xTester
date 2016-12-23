//
//  TwelfthA2CollectionView2ItemStore.swift
//  xTester
//
//  Created by Dad on 12/23/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import Foundation
import UIKit
import Alamofire
import SwiftyJSON



class TwelfthA2CollectionView2ItemStore: Utils, JsonConvertible {



  // MARK: - Enums
  enum ItemResult {
    case success(UIImage)
    case failure(Error)
  }
  
  
  enum TwelfthA2ItemResult {
    case success([TwelfthA2Item3] )
    case failure(Error)
  }
  
  
  
  enum ItemError: Error {
    case invalidJSONData
  }
  
  
  // MARK: - Local Variables
  let session = Constants.Configuration.session
  let baseURLString  = Constants.Configuration.jsonTestUrl.bikeNYC.rawValue
  let apiKey: String? = nil
  let method:String?  = nil
  var jsonResultObject:JSON?
  









} // end class
