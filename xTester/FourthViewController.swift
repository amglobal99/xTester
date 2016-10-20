//
//  FourthViewController.swift
//  xxxDump
//
//  Created by Dad on 8/6/16.
//  Copyright © 2016 Dad. All rights reserved.
//

import Foundation
import UIKit

class FourthViewController: UIViewController {
    

    @IBOutlet var cityLabel: UILabel!
    
    @IBAction func processThis( _ sender:AnyObject) {
        self.cityLabel.text = "SangliFourthController"
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    
    
}  // end class
