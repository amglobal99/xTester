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
        print("        Button(Open ViewB) - willMoveToSuperview" )
    }
    
    override func didMoveToSuperview() {
        print("        Button(Open ViewB) - didMoveToSuperview")
    }
    
    override func awakeFromNib() {
        print("        Button(Open ViewB) - awakeFromNib ......")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        print("        Button(Open ViewB) - willMoveToWindow")
    }
    
    override func didMoveToWindow() {
        print("        Button(Open ViewB) - didMoveToWindow")
    }
    

    
    
    
}  // end class
