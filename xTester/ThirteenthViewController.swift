//
//  ThirteenthViewController.swift
//  xTester
//
//  Created by Dad on 10/18/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation


import UIKit



protocol  ThirteenthMasterDelegate {
    func submit()
}




class ThirteenthViewController: UIViewController, DestinationViewDelegate {
    
    
    @IBOutlet weak var  colorView: UIView!
    
    
    // We specify that the delegate for this VC is our Destination VC
    // The value for this va is set during segue from FirstViewController.swift
    // PROBLEM: This instance is not the same as you get when you go thru prepareForSegue
    // SO NO ACCESS TO VARIABLE VALUES ....... FIGURE IT OUT LATER
    var delegateForMaster: ThirteenthMasterDelegate! = nil
    
    
    
    @IBAction func executeSubmit(_ sender: AnyObject) {
        if delegateForMaster != nil{
            delegateForMaster.submit()
        }else {
            print("value not set yet")
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if ( segue.identifier == "pickColorSegue" ) {
            let destination = segue.destination   as!  ThirteenthViewControllerDestination
            
            // Now set the delegate for that other Controller to this class (ThitreenthViewController )
            destination.delegate = self
            
            
           // self.delegateForMaster = destination
            
            
            if (colorView.backgroundColor!.isEqual(UIColor.red)) {
                print("was red")
                destination.colorLabelText = "Was red"
            } else if (colorView.backgroundColor!.isEqual(UIColor.green)) {
                print("was green")
                destination.colorLabelText = "Was green"
            } else if (colorView.backgroundColor!.isEqual(UIColor.blue)) {
                destination.colorLabelText = "Was blue"
            } else {
                print("was undselected")
                destination.colorLabelText = "Unselected"
            }
            
        } else {
            print("unknown segue")
        }
        
        
        
    }  // end function
    
    
    
    
    
    
    
    
    // Called from the destination controller via delegation
    func setColor(_ colorName: String) {
        if (colorName == "Red") {
            colorView.backgroundColor = UIColor.red
        } else if (colorName == "Green") {
            colorView.backgroundColor = UIColor.green
        } else if (colorName == "Blue") {
            colorView.backgroundColor = UIColor.blue
        }
    }
    
    
    
    
        
    
}  // end class

