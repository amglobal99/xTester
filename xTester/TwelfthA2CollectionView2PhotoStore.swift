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



class TwelfthA2CollectionView2PhotoStore: Utils, JsonConvertible {


  
  // MARK: - Enums
  enum ImageResult {
    case success(UIImage)
    case failure(Error)
  }
  
  enum PhotoError: Error {
    case imageCreationError
  }
  
  enum TwelfthA2PhotosResult {
    case success([TwelfthA2Item2] )
    case failure(Error)
  }
  
  enum FlickrError: Error {
    case invalidJSONData
  }
  
  
  // MARK: - Local Variables
  let session = Constants.Configuration.session
  var jsonResultObject:JSON?
  
  
  
  
  // MARK:- JSON Methods
  

  
  /**
   Function retrieves an array of TwelfthA2Photo objects.
   - Parameter json:  a SwiftyJSON object
   - Returns:         an array of TwelfthA2Photo objects
   */
  func photosFromJsonObject(_ json:JSON) -> TwelfthA2PhotosResult {
    var finalPhotos:[TwelfthA2Item2] = []
    var addCount = 0
    print("COLL VIEW 2 ************* JSON Object *************** \n\n \(json) ")
    
    for ( _, jsonItem) in json {
      if let photo: TwelfthA2Item2 = photoFromJSONObject(jsonItem) {
        finalPhotos.append(photo)
        addCount += 1
      }
    } // end for
    if finalPhotos.count == 0 && json.count > 0 {
      print("Sorry...No photos were retrieved")
      return  TwelfthA2PhotosResult.failure(FlickrError.invalidJSONData)
    }
    print("   ++++++++++++  Final Photos +++++++++++++++++")
    print("   Array contains \(finalPhotos.count)  photos" )
    return TwelfthA2PhotosResult.success(finalPhotos)
  } // end func
  
  
  
  
  /**
   Function to get individual Photo object.
   If any of the fields are unavailable, it returns a nil.
   Many entries do not have a URL, so that Photo wil not be returned.
   
   - Parameter json:   a SwiftyJSON object
   - Returns:          An instance of TwelfthA2Photo
   */
  func photoFromJSONObject(_ json: JSON ) -> TwelfthA2Item2? {
    guard
      let bikeID:String = json["id"].stringValue,
      let statusValue = json["statusValue"].string,
      let stAddress1 = json["stAddress1"].string,
      let stationName = json["stationName"].string,
      let availableBikes:String = json["availableBikes"].stringValue,
      let statusKey:String = json["statusKey"].stringValue
    else { return nil  }
    
    return TwelfthA2Item2(bikeID: bikeID, statusValue: statusValue, stAddress1: stAddress1, stationName: stationName, availableBikes: availableBikes, statusKey: statusKey)
  }
  
  
    
  // MARK: Section Dictionary
  
  
  
  /// Function that returns a Dictionary with SectionTitle as key and array of Photos as it values
  func sectionPhotosDictionary(from obj:JSON?, for key:String? ) -> [String:[TwelfthA2Item2]]? {
    var keyArray:[String] = []
    var photoItems:[TwelfthA2Item2] = []
    var sectionPhotosDictionary:[String:[TwelfthA2Item2]] = [:]   // Create a Dictionary to hold our data
    guard let obj = obj, let key = key else {
      return nil
    }
    print("sectionPhotosDictionary: Processing \(obj.count) objects. Key: \(key)  ")
    
    // get array of section Titles
    keyArray = getSectionTitlesArray(from: obj, key: key)!
    
    // For each key in keyArray ( these are the section Titles)
    // get all elements and create a Dictinary item
    for i in keyArray {
      for (_, things) in obj {
        if String(describing: things[key].rawValue) == i  {
          if  let photo = photoFromJSONObject(things) {
            photoItems.append(photo)
          }
        }
      } //end for
      sectionPhotosDictionary.updateValue(photoItems, forKey: i)   // add entry into Dictionary
      photoItems.removeAll()   // clear our holding array
    } // for i in
    
    //print(" +++++++++++ Section Photo Dictionary ++++++++++++++++")
    //print(sectionPhotosDictionary)
    
    return sectionPhotosDictionary   // Return value of Dictionary
    
  } // end func
  
  
  
  
  /**
   Returns the Row and Section for a particular photo
   
   - Parameter dict:  A Dcitionary with the section title as the key and array of photos as values
   - Parameter photo: The photo for which we want to identify the row number and section number
   
   - Returns: A tuple with the row number and section number
   
   */
  func indexForPhoto ( dict:[String:[TwelfthA2Item2]], photo:TwelfthA2Item2 ) -> (Int,Int)? {
    var section:String?
    var result:(Int,Int)?
    
    /*
     for (key, value) in dict {
     if  value.contains(photo) {
     section = key
     }
     }
     */
    
    // Filter the Dictionary. Retrieve key for entry which contains this photo in its values
    section = dict.filter{$1.contains(photo)}.first?.key
    
    // get array of photos for our setion
    if let section = section,  let photoArray = dict[section], let row = photoArray.index(of: photo) {
      result =  (row, Int(section)!)
    }
    return result
  }
  
  
  




} // end class
