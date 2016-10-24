//
//  TwelfthViewController.swift
//  xTester
//
//  Created by Dad on 10/18/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import Foundation

import UIKit

class TwelfthViewController: UIViewController {
    
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var containerViewA: UIView!
    @IBOutlet weak var containerViewB: UIView!
    
    
    
    
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            NSLog("First selected")
            //firstView.isHidden = false
            //secondView.isHidden = true
            containerViewA.isHidden = false
            containerViewB.isHidden = true
        case 1:
            NSLog("Second selected")
            containerViewA.isHidden = true
            containerViewB.isHidden = false
            
        default:
            break;
        }
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // firstView.isHidden = false
       // secondView.isHidden = true
        
        
        
        
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
}  // end class

