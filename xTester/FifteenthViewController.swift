//
//  FifteenthViewController.swift
//  xTester
//
//  Created by Dad on 10/18/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


class FifteenthViewController: UIViewController {
    
    let currentBalanceKeyPath = "currentBalance"
    var account = Account()
    
    @IBOutlet weak var currentBalanceLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBAction func submitAction(sender: UIButton) {
        print("executing submit action......")
        let amount = Double(amountTextField.text!)
        account.update(amount: amount!)
        amountTextField.text = nil
      //  print("finished submitAction...")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentBalanceLabel.text = "Current balance: \(account.currentBalance)"
        account.addObserver(self, forKeyPath: currentBalanceKeyPath, options: NSKeyValueObservingOptions.new, context: nil)
        print("completing viewDidlLoad")
       
    }
    
    
   
    deinit {
        account.removeObserver(self, forKeyPath: currentBalanceKeyPath)
    }
    
    
    
   //  func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutableRawPointer) {
   
    @objc override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
       // print("executing observer ...")
        if keyPath == currentBalanceKeyPath {
            if (account.currentBalance < 0) {
                currentBalanceLabel.textColor = UIColor.red
            } else {
                currentBalanceLabel.textColor = UIColor.green 
            }
            currentBalanceLabel.text = "Current balance: \(account.currentBalance)"
        }
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}  // end class








class Account: NSObject {
    
    let currentBalanceKeyPath = "currentBalance"
    let startingBalance = 100.0
    var currentBalance = 0.0
    
    override init() {
        super.init()
        currentBalance = startingBalance
    }
    
    func update(amount: Double) {
        print("starting update .....")
        currentBalance += amount
       // print("setting balance ..")
        setValue(currentBalance, forKeyPath: currentBalanceKeyPath)
       // print("finishing udate ..")
        
    }
}






