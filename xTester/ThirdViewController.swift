//
//  ThirdViewController.swift
//  xTester
//
//  Created by Dad on 12/13/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


protocol ThirdVCDelegate {
    func submitMyForm()
}


class ThirdViewController: UIViewController {
    
    @IBOutlet weak var validateLabel: UILabel!
    
    // define a Delegate for this controller
    // Using the segue from FirstViewController.swift,
    // we will assign the Destinaton Controller as the value for this var
    var delegateForMaster: ThirdVCDelegate! = nil
    
    
    
    
    @IBAction func processForm(_ sender: AnyObject) {
         delegateForMaster.submitMyForm()
    }
    
    
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
