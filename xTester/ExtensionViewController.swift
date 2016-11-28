//
//  ExtensionViewController.swift
//  xTester
//
//  Created by Dad on 10/17/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    
        // Generic function to display an alert from any ViewControlller
        func displayAlert(_ title:String, message:String, buttonText: String) {
                // Create the alert
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                // Add an action
                alert.addAction(UIAlertAction(title: buttonText, style: .default, handler:
                    { action in
                            // Dismiss when the button is pressed
                            self.dismiss(animated: true, completion: nil)
                    }))
                // Add it to viewController
                self.present(alert, animated: true, completion: nil)
        } // end function
    
    
    
    
    
    
    
    
    
    
    
}  // end class
