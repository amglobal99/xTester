//
//  TenthViewController.swift
//  xTester
//
//  Created by Dad on 10/17/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit



class TenthViewController: UIViewController {
    
    
    @IBAction func showGenericAlert(_ sender: AnyObject) {
       // print("will print ..")
        
        displayAlert( "Tittl", error: "Some error", buttonText: "OK")
        
    }
    
    
    
    // Show Action Sheet
    
    @IBAction func displayActionSheet(_ sender: AnyObject  ) {
        
        let optionMenu = UIAlertController(title: nil, message: "Tittle ", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("File Deleted")
        })
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("File Saved")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: {
            print("completed .....")
            }
        )
    }
    

    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("  ViewController 10  - viewDidLoad")
        
    }
    
    
    
    
}
