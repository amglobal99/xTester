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
    
    // Specify name of the property we want to observe
    let currentBalanceKeyPath = "currentBalance"
    
    // craete an instnace of the other class thta we wnat to observe
    var account = Account()
    
    
    @IBOutlet weak var currentBalanceLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    
    
    @IBAction func submitAction(sender: UIButton) {
        print("executing submit action......")
        // Get value from Field on form
        let amount = Double(amountTextField.text!)
        
        // Update the balance in Account object
        account.update(amount: amount!)
        
        // Clear field on form
        amountTextField.text = nil
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentBalanceLabel.text = "Current balance: \(account.currentBalance)"
        // This is how you add an observer. In our case, our 'account' var refers to insance of Account
        account.addObserver(self, forKeyPath: currentBalanceKeyPath, options: NSKeyValueObservingOptions.new, context: nil)
        print("completing viewDidlLoad")
    }
    
    
    
    // Always remove observer when object goes away
    deinit {
        account.removeObserver(self, forKeyPath: currentBalanceKeyPath)
    }
    
    
  
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("executing observer ...")
        if keyPath == currentBalanceKeyPath {
            if (account.currentBalance < 0) {
                currentBalanceLabel.textColor = UIColor.red
            } else {
                currentBalanceLabel.textColor = UIColor.green
            }
            currentBalanceLabel.text = "Current balance: \(account.currentBalance)"
        }
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
        setValue(currentBalance, forKeyPath: currentBalanceKeyPath)  // Thisis  a method for NSObject
        print("finishing udate ..")
        
    }
}






