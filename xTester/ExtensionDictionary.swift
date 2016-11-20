//
//  ExtensionDictionary.swift
//  xTester
//
//  Created by Dad on 11/19/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import Foundation
import UIKit

    
    extension Dictionary where Value: Equatable {
        

        func allKeys(forValue val: Value) -> [Key] {
            return self.filter { $1 == val }.map { $0.0 }
        }
        
        
    } // end extn
    
    
    
  
