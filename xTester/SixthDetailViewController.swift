//
//  SixthDetailViewController.swift
//  xTester
//
//  Created by Dad on 10/7/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit



class SixthDetailViewController: UIViewController {
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("  ViewController B  (Second) - viewDidLoad")
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("  ViewController B  (Second) - viewWillAppear ")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("  ViewController B   (Second) - viewDidAppear.    \n  **************************************** \n ")
    }
    

    override func viewWillLayoutSubviews() {
        print("  ViewController B   (Second) - viewWillLayoutSubviews")
    }
    
    
    override func viewDidLayoutSubviews() {
        //  print("ViewController A    - viewDidLayoutSubviews")
    }
    
    
    
    
    
    
    
    
}   // end class
