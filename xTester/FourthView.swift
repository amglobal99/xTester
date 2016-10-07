//
//  FourthView.swift
//  xxxDump
//
//  Created by Dad on 10/5/16.
//  Copyright © 2016 Dad. All rights reserved.
//

import Foundation
import UIKit



class FourthView: UIView {
    
    override func willMove(toSuperview newSuperview: UIView?) {
        print("willMoveToSuperview" )
    }

    override func didMoveToSuperview() {
        print("didMoveToSuperview")
    }
    
    override func awakeFromNib() {
        print("awakeFromNib ......")
    }

    override func willMove(toWindow newWindow: UIWindow?) {
        print("willMoveToWindow")
    }
    
    override func didMoveToWindow() {
        print("didMoveToWindow")
    }
    
    
    
}   // end class
