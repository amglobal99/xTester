//
//  ExtensionFloat.swift
//  xTester
//
//  Created by Dad on 1/14/17.
//  Copyright © 2017 Natsys. All rights reserved.
//

import Foundation



///Usage:
///let amount = 100.07
///let amountString = amount.asLocaleCurrency
///print(amount.asLocaleCurrency())
/// prints: "$100.07"



extension Float {
  var asLocaleCurrency:String {
    let num = self as NSNumber
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale.current
    //return formatter.string(from: NSNumber(self))!
    return formatter.string(from: num)!
    
  }
}
