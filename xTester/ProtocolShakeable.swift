//
//  ProtocolShakeable.swift
//  xTester
//
//  Created by Dad on 10/29/16.
//  Copyright © 2016 Natsys. All rights reserved.
//



import Foundation
import UIKit
import BRYXBanner
import Alamofire




// MARK: Protocols

protocol Shakeable { }   // allows elemenst to shake






// MARK: - Extension Shakeable

extension Shakeable where Self:UIView {
    
    //extension Shakeable   {
    
    /*
     func shake() {
     let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
     animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
     animation.duration = 0.6
     animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
     layer.add(animation, forKey: "shake")
     }
     
     */
    
    
    
    // Usage for this function
    //You can call this function on any UIView, button, label textview etc. This way
    //yourView.shake()
    //Or this way if you want to add some custom parameters :
    //yourView.shake(count: 5, for: 1.5, withTanslation: 10)
    
    //
    func shake(count : Float? = nil,for duration : TimeInterval? = nil,withTanslation translation : Float? = nil) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.repeatCount = count ?? 2
        animation.duration = (duration ?? 0.5)/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation ?? -5
        layer.add(animation, forKey: "shake")
    }
    
    
    
}





