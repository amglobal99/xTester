//
//  SixthViewController.swift
//  xTester
//
//  Created by Dad on 10/7/16.
//  Copyright © 2016 Natsys. All rights reserved.
//






import Foundation
import UIKit

class SixthViewController: UIViewController {
    
    

    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        print("ViewController A    - viewDidLoad. Main View has been loaded into memory.")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewController A    - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewController A    - viewDidAppear \n  **************************************** \n ")
    }
    
    
    override func viewWillLayoutSubviews() {
        // print("ViewController A    - viewWillLayoutSubviews")
    }
    
    
    override func viewDidLayoutSubviews() {
        //  print("ViewController A    - viewDidLayoutSubviews")
    }
    
    

    
}  // end class
