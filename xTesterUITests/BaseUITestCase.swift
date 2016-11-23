//
//  BaseUITestCase.swift
//  xTester
//
//  Created by Dad on 11/22/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import Alamofire
import XCTest

@testable import xTester



class BaseUITestCase: XCTestCase, JsonConvertible {


        let app = XCUIApplication()
        
        override func setUp() {
            super.setUp()
            continueAfterFailure = false
            app.launch()
        }
        
        
    



}
