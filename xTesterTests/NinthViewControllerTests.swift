//
//  NinthViewControllerTests.swift
//  xTester
//
//  Created by Dad on 11/14/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import XCTest
import Foundation
import Alamofire
import SwiftyJSON



@testable import xTester




class NinthViewControllerTests: BaseTestCase {


        var ninthVC: NinthViewController!
    
    

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //let bundle = Bundle(for: type(of: self) )
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Ninth", bundle: bundle)
        ninthVC = storyboard.instantiateViewController(withIdentifier: "Ninth")  as! NinthViewController
        
        // ====== In our app, we inject these properties during segue from Main Storyboard
        ninthVC.city = "Jack City"  // REMOVE THIS LATER
        ninthVC.store = NinthPhotoStore()  // give the VC a store object
        ninthVC.photoDataSource = NinthPhotoCollectionViewDataSource()
        
        let dummy  = ninthVC.view // force loading subviews and setting outlets
        //ninthVC.viewDidLoad()
        
    }
    
    
    
    
    
    func testThatAPIKeyIsAvailable() {
        XCTAssertNotNil(ninthVC.APIKey )
        
    }
    
    
    func testThatPhotoCollectionViewIsAvailable() {
        XCTAssertNotNil(ninthVC.photoCollectionView)
    }

    
    func testThatBaseUrlStringIsAvailable() {
        XCTAssertNotNil(ninthVC.baseURLString)
    }
    
    
    func testThatCityIsAvailable() {
        XCTAssertNotNil(ninthVC.city == "Jack City")
    }
    
    
    func testThatStoreIsAvailable() {
        XCTAssertNotNil(ninthVC.store )
    }
    
    
    func testThatPhotoDataSourceIsAvailable() {
        XCTAssertNotNil(ninthVC.photoDataSource )
    }
    
    
    func testThatPhotoCollectionViewDataSourceIsAvailable() {
        XCTAssertNotNil(ninthVC.photoCollectionView.dataSource )
        
    }
    
    
    
    
    // Let's check the methods
    
    
    func testThatGetSiteURLReturnsSuccessResultWithValidData() {
        let url = ninthVC.getSiteURL(baseURLString: ninthVC.baseURLString, method: ninthVC.method, parameters: ninthVC.params, apiKey: ninthVC.APIKey)
        XCTAssertNotNil(url)
    }
    
    
    func testThatViewDidLoadReturnsSuccessResultWithValidData() {
        ninthVC.viewDidLoad()
        let sections = ninthVC.photoDataSource.sections
        let photos = ninthVC.photoDataSource.photos
        let items = ninthVC.photoDataSource.sectionItems
        XCTAssertNotNil(sections)
        XCTAssertNotNil(photos)
        XCTAssertNotNil(items)
    }
    
    
    
    func testThatViewDidLoadHasAccessToNinthViewController() {
        XCTAssertNotNil(ninthVC)
        
    }
    
    
    
    // Use this function as a template for testing Asynchronous requests
    //
    
    func testThatAlamofireResponseReturnsSuccessResultWithValidData() {
        
        //Step 1 ...... Create a expectation
        let expectation = self.expectation(description: "request should succeed")
        
        
        //let urlString = "https://httpbin.org/get"
        let urlString = ninthVC.getSiteURL(baseURLString: ninthVC.baseURLString, method: ninthVC.method, parameters: ninthVC.params, apiKey: ninthVC.APIKey)
        var response: DefaultDataResponse?
        
        // Start your Async request
        Alamofire.request(urlString, parameters: ["foo": "bar"]).response
            { resp in
                response = resp
                
                // Step 2 ...... In the completion handler, call fulfill method
                expectation.fulfill()
            }
        
        // Step 3 .... At end of method, call waitForExpectations
        waitForExpectations(timeout: timeout, handler: nil)
        
        // Then
        XCTAssertNotNil(response?.request)
        XCTAssertNotNil(response?.response)
        XCTAssertNotNil(response?.data)
        XCTAssertNil(response?.error)
        
        if #available(iOS 10.0, macOS 10.12, tvOS 10.0, *) {
            XCTAssertNotNil(response?.metrics)
        }
    }
    
    
    
    
    
   
    
    func testThatGetJSONObjectMethodReturnsSuccessResultWithValidData() {
        
        var jsonObject:JSON?
        //Step 1 ...... Create a expectation
        let expectation = self.expectation(description: "request should succeed")
        
        let urlString = ninthVC.getSiteURL(baseURLString: ninthVC.baseURLString, method: ninthVC.method, parameters: ninthVC.params, apiKey: ninthVC.APIKey)
        var response: DefaultDataResponse?
        weak var weakSelf = self
        
        let completionHandler: (Result<JSON>) -> Void  =
            {   resp in
                    jsonObject = resp.value!
                    // Step 2 ...... In the completion handler, call fulfill method
                    expectation.fulfill()
            } // end closure
        
        
        let url = ninthVC.getSiteURL(baseURLString: ninthVC.baseURLString, method: ninthVC.method, parameters: ninthVC.params, apiKey: ninthVC.APIKey)
        getJSONObject(for: urlString, rootPath: Constants.FlickrApi.rootPath, completionHandler: completionHandler)  // get a SwiftyJSON object
        
        // Step 3 .... At end of method, call waitForExpectations
        waitForExpectations(timeout: timeout, handler: nil)
        
        // Then
        /*
        XCTAssertNotNil(response?.request)
        XCTAssertNotNil(response?.response)
        XCTAssertNotNil(response?.data)
        XCTAssertNil(response?.error)
        */
        
         XCTAssertNotNil(jsonObject )
        
    } // end func
    
    
   
    
    
    func testPrepareForSegue() {
        
        // 1. Arrange
        let controller = ninthVC
        //controller.argumentToPass = "Argument to pass"
        let otherController = NinthDetailViewController()
        let segue = UIStoryboardSegue(identifier: "ShowNinthPhotoDetail",
                                      source: ninthVC,
                                      destination: otherController)
        
        // 2. Action
        controller?.prepare(for: segue, sender: nil)
        
        // 3. Assert
        XCTAssertNotNil(otherController.store)
        
    }
    
    
    
    
    
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    
    
    



}  // end class
