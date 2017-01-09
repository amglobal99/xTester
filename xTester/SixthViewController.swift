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
    
    
    // Create an array to store our log messages ( to be diaplyd on screen)
    var eventsArray:[String] = []
    
    
    @IBOutlet weak var eventsTextLabel: UILabel!
    
    
    

    override func viewDidLoad() {
          super.viewDidLoad()
        print("ViewController A    - viewDidLoad. Main View has been loaded into memory.")
        // Do any additional setup after loading the view, typically from a nib.
        
        eventsArray.append("ViewController A    - viewDidLoad. Main View has been loaded into memory. \n"  )
        //self.eventsTextLabel.text = eventsArray.joined()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewController A    - viewWillAppear: Starting execution.")
        eventsArray.append("ViewController A    - viewWillAppear \n " )
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewController A    - viewDidAppear \n  **************************************** \n ")
        eventsArray.append("ViewController A    - viewDidAppear \n  **************************************** \n " )
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewController A    - viewWillDisAppear \n  **************************************** \n ")
         eventsArray.append("ViewController A    - viewWillDisAppear \n ")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewController A    - viewDidDisappear \n  **************************************** \n ")
        eventsArray.append("ViewController A    - viewDidDisappear \n ")
    }
    
        override func viewWillLayoutSubviews() {
        // print("ViewController A    - viewWillLayoutSubviews")
            eventsArray.append("ViewController A    - viewWillLayoutSubviews")
    }
    
    
    override func viewDidLayoutSubviews() {
        //  print("ViewController A    - viewDidLayoutSubviews")
        eventsArray.append("ViewController A    - viewDidLayoutSubviews" )
    }
    
    

    
}  // end class
