//
//  FirstViewController.swift
//  xxxDump
//
//  Created by Dad on 5/2/16.
//  Copyright © 2016 Dad. All rights reserved.
//

import Foundation
import UIKit


class FirstViewController: UIViewController {
    
    @IBOutlet var cityLabel: UILabel!
    
    
    @IBAction func changeCityLabel(_ sender: AnyObject) {
        self.cityLabel.text = "Hello world"
        
        print("chnageLabel")
    
    }
    
    
    // ....JP
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

