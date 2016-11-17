//
//  TestCase.swift
//  xTester
//
//  Created by Dad on 11/14/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import Alamofire
import XCTest

@testable import xTester



class BaseTestCase: XCTestCase, JsonConvertible {
    
    let timeout: TimeInterval = 15.0
    
    static var testDirectoryURL: URL {
        return  URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("org.alamofire.tests") as URL
    }
    
    var testDirectoryURL: URL { return BaseTestCase.testDirectoryURL }
    
    
    
    override func setUp() {
        super.setUp()
        
        
        /*
        FileManager.removeItem(at: testDirectoryURL)
        
        FileManager.createDirectory(at: testDirectoryURL, withIntermediateDirectories: true, attributes: nil)
 
        */
        
        
 
    }
    
    
    
    func url(forResource fileName: String, withExtension ext: String) -> URL {
        let bundle = Bundle(for: BaseTestCase.self)
        // let bundle = Bundle.main
        return bundle.url(forResource: fileName, withExtension: ext)!
    }
 
 
    
    
    
 
 
}  // end class
