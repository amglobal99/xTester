//
//  ProtocolDateTimeConvertible.swift
//  xTester
//
//  Created by Dad on 11/21/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import Foundation
import UIKit


protocol DateTimeConvertible { }





extension DateTimeConvertible {
    
  
    
  
    /// Function computes difference between two Dates
    func timeDiff(_ date1: Date) -> Double {
        let  date2: Date = Date()
        return date2.timeIntervalSince(date1)
        
    }
    
    
    


    
    
}  // end extension
