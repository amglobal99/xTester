//
//  ThirdViewController.swift
//  xTester
//
//  Created by Dad on 12/13/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit






class ThirdViewController: UIViewController, UITextFieldDelegate  {
    
    
    
    @IBOutlet weak var validateLabel: UILabel!
    
    
    weak var companyController: ThirdViewControllerTableVC?
    
    
    
    
    override func viewDidLoad() {
        
        // We want to hide then keyboard wen user clicks anywhere on screen
        self.hideKeyboardWhenTappedAround()
        validateLabel.isHidden = true
    
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "containerViewSegue" {
            //containerViewController = segue.destinationViewController as? ThirdViewControllerTableVC
            //containerViewController!.containerToMaster = self
        }
        
        
        
        
    }
    
    
} // end class
