//
//  TwelfthA2Photo.swift
//  xTester
//
//  Created by Dad on 11/24/16.
//  Copyright © 2016 Natsys. All rights reserved.
//



import Foundation
import UIKit


class TwelfthA2Photo {
    
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    var image: UIImage?
    let datetakenUnknown:String
    
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date, datetakenUnknown:String) {
        self.title = title
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
        //self.image = image
        self.datetakenUnknown = datetakenUnknown
    }
    
}  //end class




extension TwelfthA2Photo: Equatable {}


func == (lhs:TwelfthA2Photo, rhs: TwelfthA2Photo) -> Bool  {
    return lhs.photoID == rhs.photoID
}




