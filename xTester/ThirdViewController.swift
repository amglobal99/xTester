//
//  ThirdViewController.swift
//  xxxDump
//
//  Created by Dad on 5/2/16.
//  Copyright © 2016 Dad. All rights reserved.
//  test Comment



import Foundation
import UIKit


// Make the class confirm to Utils protocol
class ThirdViewController: UIViewController, Utils {
    
    
    @IBOutlet weak var idLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var zipLabel: UITextField!
    @IBOutlet weak var salesLabel: UITextField!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Use method from protocol
        self.climb()
        
        
        printCompanyName()
        
        
        
    }  // end method
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

