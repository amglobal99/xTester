//
//  ThirteenthViewControllerDestination.swift
//  xTester
//
//  Created by Dad on 10/18/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


protocol DestinationViewDelegate {
    func setColor(_ colorName: String)
}




class ThirteenthViewControllerDestination: UIViewController, ThirteenthMasterDelegate {
    
    
    @IBOutlet weak var destinationOutletLabel: UILabel!
    
    // Now we want a property which tells us "Who is the delegate for this Controller ?"
    // We will call our property 'delegate' and it conforms to DestinationViewDelegate protocol
    // This 'delegate' property will be set from the other View Controller during segue ( prepareForSegue method )
    
    
    var delegate: DestinationViewDelegate! = nil
    
    
    var colorLabelText: String! = nil
    
    
    
    @IBAction func touchUpInsideSelectedColor(_ sender: UIButton) {
        
        if let title = sender.currentTitle {
            delegate.setColor(title)
           // self.navigationController?.popToRootViewController(animated: true)
            _ = self.navigationController?.popViewController(animated: true)   // Remove from Navigation array
        } else {
            print("title is nil")
        }
        
    }  // end func
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // Set the color text to the value passed in from the segue
        destinationOutletLabel.text = colorLabelText
    }
    
    
    
    
    func submit() {
        print("test")
    }
    
    
    
    
    
    
}   // end class
 
