//
//  ExtensionUIColor.swift
//  xTester
//
//  Created by Dad on 11/21/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


func generateRandomData() -> [[UIColor]] {
    //let numberOfRows = 20
    //let numberOfItemsPerRow = 15
    
    let numberOfRows = 1
    let numberOfItemsPerRow = 7
    
    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
    }
}


extension UIColor {
  
  
  
  public convenience init? (hexString: String) {
    //public convenience init (hexString: String) {
    let r, g, b, a: CGFloat
    
    if hexString.hasPrefix("#") {
      let start = hexString.index(hexString.startIndex, offsetBy: 1)
      let hexColor = hexString.substring(from: start)
      
      if hexColor.characters.count == 8 {
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
          r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          a = CGFloat(hexNumber & 0x000000ff) / 255
          
          self.init(red: r, green: g, blue: b, alpha: a)
          return
        }
      }
    }  // end if
    
    
    return nil
    // return UIColor.blue
    
    
  } // end init
  
  

  
  
  
  
  
  
  
    class func randomColor() -> UIColor {
      
        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
  
  
  
  
  
  
}

