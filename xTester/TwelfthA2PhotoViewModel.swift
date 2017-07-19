//
//  TwelfthA2PhotoViewModel.swift
//  xTester
//
//  Created by Jack Patil on 7/18/17.
//  Copyright © 2017 Natsys. All rights reserved.
//

import Foundation
import UIKit


class TwelfthA2PhotoViewModel  {
   
   // This is a reference to our Model object
   fileprivate var twelfthA2Photo: TwelfthA2Photo
   
   
   var titleText: String {
      return twelfthA2Photo.title
   }
   
   var remoteURLText: URL {
      return twelfthA2Photo.remoteURL
   }
   
   var photoIDText: String {
      return twelfthA2Photo.photoID
   }
   
   var imageText: UIImage? {
      return twelfthA2Photo.image
   }
   
   var datetakenUnknownText:String {
      return twelfthA2Photo.datetakenUnknown
   }
   
  
   
   
   init(photo: TwelfthA2Photo) {
      self.twelfthA2Photo = photo
   }
   
   
}
