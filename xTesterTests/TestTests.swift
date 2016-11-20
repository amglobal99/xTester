//
//  TestTests.swift
//  xTester
//
//  Created by Dad on 11/15/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import XCTest
import Foundation

@testable import xTester



class TestTests: BaseTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    
    // Lets's write our tests in this section
    
    
    // ==================  Tests for Test Class =======================
    func testAge() {
        let tst = Test()
        let theAge: Int  = tst.showAge(80)
        XCTAssert( theAge > 35 )
         }
    
    /*
    func testAge2() {
        let tst = Test()
        let theAge2: Int  = tst.showAge(40)
        XCTAssert( theAge2 > 35 )
        
    }
    */
    
    
    
    
    func testDoSomething()  {
        let tst = Test()
        let  check: Bool = tst.doSomething("Pune")
        XCTAssert(check, "Sorty failed")
    }
    
    
    
    
    
    
    
    func testDoSomething2()  {
        let tst = Test()
        let check2: Bool = tst.doSomething("Sangli")
        XCTAssert(check2, "Second check failed")
    }
   
    
    
    
    
    
    
    
    
    //  ==================  end Test Class section ======================
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}  // end class
