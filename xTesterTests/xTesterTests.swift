//
//  xTesterTests.swift
//  xTesterTests
//
//  Created by Dad on 10/7/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import XCTest
@testable import xTester

class xTesterTests: XCTestCase, JsonConvertible {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    
    
    // Lets's write our tests in this section
    

    // ==================  Tests for Test Class =======================
    func testAge() {
        let tst = Test()
        let theAge: Int  = tst.showAge(80)
        XCTAssert( theAge > 35 )
    }
    
    func testAge2() {
        let tst = Test()
        let theAge2: Int  = tst.showAge(40)
        XCTAssert( theAge2 > 35 )
        
    }
    
    
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
    
    
    
    
    
    // ++++++++++++++++++++  Tests for FifthViewController +++++++++++++++++++
    
    /*
    func testGetJsonObject() {
        let urlString =   "https://api.flickr.com/services/rest"
        let url = URL(string: urlString)
        
        
        let fifthVC = FifthViewController()
        let jsonObject = getJSONObject(for: url!, rootPath: ["photos","photo"], completionHandler: )  //
    
    
    
        
    }
    */
    
    
    
    
    // ++++++++++++++++++++   end Tests for FifthViewController ++++++++++++++++
    
    
    
}  // end class
