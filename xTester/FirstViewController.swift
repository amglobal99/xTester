//
//  FirstViewController.swift
//  xxxDump
//
//  Created by Dad on 5/2/16.
//  Copyright © 2016 Dad. All rights reserved.
//

import Foundation
import UIKit


class FirstViewController: UIViewController, Utils {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            NSLog("Popular selected")
        //show popular view
        case 1:
            NSLog("History selected")
        //show history view
        case 2:
            NSLog("Third View")
        default:
            break;
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

       showBanner(title: "Gist Manager", subtitle: "Welcome to our app", image: nil, bkColor: UIColor.red)
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}  // end class

