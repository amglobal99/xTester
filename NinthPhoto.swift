//
//  NinthPhoto.swift
//  xTester
//
//  Created by Dad on 11/4/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


class NinthPhoto {
    
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




extension NinthPhoto: Equatable {}


func == (lhs:NinthPhoto, rhs: NinthPhoto) -> Bool  {
    return lhs.photoID == rhs.photoID
}




