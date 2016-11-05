//
//  SixthVCView.swift
//  xTester
//
//  Created by Dad on 10/7/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import Foundation
import UIKit


class SixthVCView: UIView {
    
    
    override func awakeFromNib() {
        print("  ViewController A has just finished its loadView method")
        print("     View A    - awakeFromNib.   Main View is avail with its outlets and connections.")
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        print("     View A    - willMoveToSuperview " )
        if (newSuperview == nil) {
            print("     View A    - willMoveToSuperview.  View is being *** REMOVED *** from current Superview")
        }
    }
    
    
    override func didMoveToSuperview() {
        print("     View A    - didMoveToSuperview.   View has bene added as a subview.")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        print("     View A    - willMoveToWindow. Window is about to be changed.")
    }
    
    override func didMoveToWindow() {
        print("     View A    - didMoveToWindow.  Window has been chnaged.")
    }
    
    
    
    
}   // end class
