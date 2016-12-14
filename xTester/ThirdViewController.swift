//
//  ThirdViewController.swift
//  xTester
//
//  Created by Dad on 12/13/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit





class ThirdViewController: UIViewController {
    
    @IBOutlet weak var validateLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        // We want to hide then keyboard wen user clicks anywhere on screen
        self.hideKeyboardWhenTappedAround()
        validateLabel.isHidden = true
    }
    
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CompanyFormSegue" {
           // destinationViewController = segue.destinationViewController as? ThirdViewControllerTableVC
            let destinationViewController = segue.destination as? ThirdViewControllerTableVC
            destinationViewController?.delegate = self
        }
    }
    
    */
    
    
    
    
    
    
    
    
    
} // end class
