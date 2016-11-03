//
//  Photo.swift
//  xTester
//
//  Created by Dad on 11/2/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import Foundation
import UIKit


class Photo {
    
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    var image: UIImage?
    
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
        self.title = title
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
        //self.image = image
    }
    
}  //end class


extension Photo: Equatable {}


func == (lhs:Photo, rhs: Photo) -> Bool  {
    return lhs.photoID == rhs.photoID
}
