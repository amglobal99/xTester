//
//  SixthDetailVCView.swift
//  xTester
//
//  Created by Dad on 10/7/16.
//  Copyright © 2016 Natsys. All rights reserved.
//



import Foundation
import UIKit



class SixthDetailVCView: UIView {
    
    override func willMove(toSuperview newSuperview: UIView?) {
        print("        View B    - willMoveToSuperview" )
        if (newSuperview == nil) {
            print("     View B   - willMoveToSuperview.  View is being *** REMOVED *** from current Superview")
        }
    }
    
    override func didMoveToSuperview() {
        print("        View B    - didMoveToSuperview")
        
    }
    
    override func awakeFromNib() {
        print("        View B    - awakeFromNib ......")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        print("        View B    - willMoveToWindow")
    }
    
    override func didMoveToWindow() {
        print("        View B    - didMoveToWindow")
    }
    
    
    
}   // end class

