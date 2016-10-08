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
        print("        Button - willMoveToSuperview" )
    }
    
    override func didMoveToSuperview() {
        print("        Button - didMoveToSuperview")
    }
    
    override func awakeFromNib() {
        print("        Button - awakeFromNib ......")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        print("        Button - willMoveToWindow")
    }
    
    override func didMoveToWindow() {
        print("        Button - didMoveToWindow")
    }
    

    
    
    
}  // end class
