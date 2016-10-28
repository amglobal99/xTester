//
//  TenthViewController.swift
//  xTester
//
//  Created by Dad on 10/17/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit



class TenthViewController: UIViewController, Utils {
    
    
    @IBAction func showGenericAlert(_ sender: AnyObject) {
       // print("will print ..")
        
        displayAlert( "Action Required", error: "No Internet Connetion. \nClick home button to quit app.", buttonText: "OK")
        
    }
    
    
    
    // Show Action Sheet
    
    @IBAction func displayActionSheet(_ sender: AnyObject  ) {
        
        let optionMenu = UIAlertController(title: nil, message: "Action Required for Error", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("File will be Deleted")
        })
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("File will be Saved")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: {
            print("completed presenting alert.....")
            }
        )
    }
    

    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        showBanner(title: "Simple BAnnner", subtitle: "Please correct this error \n and try again", image: nil, bkColor: UIColor.red)
        
        
        
        
    }
    
    
    
    
}
