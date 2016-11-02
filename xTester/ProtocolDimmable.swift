//
//  ProtocolDimmable.swift
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


protocol Dimmable { }   // allows elements to dim




// MARK: - Extension Dimmable

enum Direction { case In, Out }


extension Dimmable where Self: UIViewController {
    
    func dim(direction: Direction, color: UIColor = UIColor.black, alpha: CGFloat = 0.0, speed: Double = 0.0) {
        
        switch direction {
            
        case .In:
            // Create and add a dim view
            let dimView = UIView(frame: view.frame)
            dimView.backgroundColor = color
            dimView.alpha = 0.0
            view.addSubview(dimView)
            // Deal with Auto Layout
            dimView.translatesAutoresizingMaskIntoConstraints = false
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            // Animate alpha (the actual "dimming" effect)
            UIView.animate(withDuration: speed) { () -> Void in
                dimView.alpha = alpha
            }
        case .Out:
            UIView.animate(withDuration: speed, animations: { () -> Void in
                self.view.subviews.last?.alpha = alpha ?? 0
                }, completion: { (complete) -> Void in
                    self.view.subviews.last?.removeFromSuperview()
            })
        }
    }  // end func
    
} // end extension



