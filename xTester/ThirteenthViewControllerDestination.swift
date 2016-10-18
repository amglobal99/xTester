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




class ThirteenthViewControllerDestination: UIViewController {
    
    
    @IBOutlet weak var destinationOutletLabel: UILabel!
    
    
    var delegate: DestinationViewDelegate! = nil
    var colorLabelText: String! = nil
    
    
    @IBAction func touchUpInsideSelectedColor(_ sender: UIButton) {
        
        if let title = sender.currentTitle {
            delegate.setColor(title)
           // self.navigationController?.popToRootViewController(animated: true)
            self.navigationController?.popViewController(animated: true)
            
        } else {
            print("title is nil")
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the color text to the value passed in from the segue
        destinationOutletLabel.text = colorLabelText
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

    
    
}
