//
//  TwelfthA1ViewController.swift
//  xTester
//
//  Created by Dad on 10/28/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import Foundation
import UIKit

class TwelfthA1ViewController: UIViewController, Utils{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Let's check if Internet CONNECTION is available
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            displayAlert( "Action Required", message: "No Internet Connetion. \nClick home button to quit app.", buttonText: "OK")
            //return
        }
        
        
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}  // end class
