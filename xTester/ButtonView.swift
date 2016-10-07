//
//  ButtonProcess.swift
//  xxxDump
//
//  Created by Dad on 10/5/16.
//  Copyright © 2016 Dad. All rights reserved.
//

import Foundation
import UIKit



class ButtonView: UIButton{
    
    
    override func willMove(toSuperview newSuperview: UIView?) {
        print("BwillMoveToSuperview" )
    }
    
    override func didMoveToSuperview() {
        print("BdidMoveToSuperview")
    }
    
    override func awakeFromNib() {
        print("BawakeFromNib ......")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        print("BwillMoveToWindow")
    }
    
    override func didMoveToWindow() {
        print("BdidMoveToWindow")
    }
    

    
    
    
}  // end class
