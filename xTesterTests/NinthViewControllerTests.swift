//
//  NinthViewControllerTests.swift
//  xTester
//
//  Created by Dad on 11/14/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import XCTest
import UIKit
import Foundation
import Alamofire
import SwiftyJSON

@testable import xTester




class NinthViewControllerTests: BaseTestCase {


        var ninthVC: NinthViewController!
        var ninthDestinationVC: NinthDetailViewController!
    
    
    // MARK: - Setup

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //let bundle = Bundle(for: type(of: self) )   // this gave me an error
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Ninth", bundle: bundle)
        
        // Create your ViewControllers
        ninthVC = storyboard.instantiateViewController(withIdentifier: "Ninth")  as! NinthViewController
        ninthDestinationVC = storyboard.instantiateViewController(withIdentifier: "NinthDetailViewController")  as! NinthDetailViewController
        
        
        
        
        // ====== In our app, we inject these properties during segue from Main Storyboard
        ninthVC.city = "Jack City"  // REMOVE THIS LATER
        ninthVC.store = NinthPhotoStore()  // give the VC a store object
        ninthVC.photoDataSource = NinthPhotoCollectionViewDataSource()
        
        let _  = ninthVC.view // force loading subviews and setting outlets ( this executes viewDidLoad and other view events)
        
    
        
    
    
    }  // end setup
    
    
    
    
    
    
    
    
    // MARK: - Check for Values of properties
    
    // Check availability of values for properties
    
    
    func testThatBaseUrlStringIsAvailable() {
        XCTAssertNotNil(ninthVC.baseURLString)
    }
    
    func testThatAPIKeyIsAvailable() {
        XCTAssertNotNil(ninthVC.apiKey )
        
    }
    
    func testThatMethodIsAvailable() {
        XCTAssertNotNil(ninthVC.method )
        
    }
    
    func testThatKeyIsAvailable() {
        XCTAssertNotNil(ninthVC.key )
        
    }
    
    func testThatRootPathIsAvailable() {
        XCTAssertNotNil(ninthVC.rootPath)
        
    }
    
    func testThatDataKeyIsAvailable() {
        XCTAssertNotNil(ninthVC.dataKey)
        
    }

    func testThatParamsIsAvailable() {
        XCTAssertNotNil(ninthVC.params)
        
    }
    
    
    func testThatPhotoCollectionViewIsAvailable() {
        XCTAssertNotNil(ninthVC.photoCollectionView)
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
    
    
    
    
    func testThatCityIsAvailable() {
        XCTAssertNotNil(ninthVC.city == "Jack City")
    }
    
    
        
    
    
    // MARK: - Check Methods
    
    
    
    func testThatGetSiteURLReturnsSuccessResultWithValidData() {
        let url = ninthVC.getSiteURL(baseURLString: ninthVC.baseURLString, method: ninthVC.method, parameters: ninthVC.params, apiKey: ninthVC.apiKey)
        XCTAssertNotNil(url)
    }
    
    
    func testThatViewDidLoadReturnsSuccessResultWithValidData() {
        //ninthVC.viewDidLoad() 
        // View events get triggered in Setup for each test
        let sections = ninthVC.photoDataSource.sections
        let photos = ninthVC.photoDataSource.photos
        let items = ninthVC.photoDataSource.sectionPhotoItems
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
        let urlString = ninthVC.getSiteURL(baseURLString: ninthVC.baseURLString, method: ninthVC.method, parameters: ninthVC.params, apiKey: ninthVC.apiKey)
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
        let expectation = self.expectation(description: "request should succeed")   //Step 1 ...... Create a expectation
        let urlString = ninthVC.getSiteURL(baseURLString: ninthVC.baseURLString,
                                           method: ninthVC.method,
                                           parameters: ninthVC.params,
                                           apiKey: ninthVC.apiKey)
        var response: DefaultDataResponse?
        weak var weakSelf = self
        
        let completionHandler: (Result<JSON>) -> Void  =
            {   resp in
                    jsonObject = resp.value!
                    expectation.fulfill()   // Step 2 ...... In the completion handler, call fulfill method
            } // end closure
        

        getJSONObject(for: urlString, rootPath: Constants.Configuration.rootPath, completionHandler: completionHandler)  // get a SwiftyJSON object
        waitForExpectations(timeout: timeout, handler: nil)
         XCTAssertNotNil(jsonObject )
        
    } // end func
    
    
   
    
    
    
    
    
    
    func testThatStoreIsAvailableInPrepareForSegue() {
        
        let controller = ninthVC
        let otherController = NinthDetailViewController()
        let segue = UIStoryboardSegue(identifier: "ShowNinthPhotoDetail",  source: ninthVC,    destination: otherController)
        
        ninthVC.city = "Jack City"  // REMOVE THIS LATER
        ninthVC.store = NinthPhotoStore()  // give the VC a store object
        ninthVC.photoDataSource = NinthPhotoCollectionViewDataSource()
        
        // set store property
        otherController.store = ninthVC.store

        // 2. Action
        controller?.prepare(for: segue, sender: nil)
        
        
        // 3. Assert
        XCTAssertNotNil(segue)
        XCTAssertNotNil( otherController.store   )
        
        
        
    }
    
    
    
    
    func testThatPhotoIsSelected() {
        
        
        class mockUICollectionView: UICollectionView {
            
            
        }
        
        let controller = ninthVC
        let otherController = ninthDestinationVC
        let segue = UIStoryboardSegue(identifier: "ShowNinthPhotoDetail",  source: ninthVC,    destination: ninthDestinationVC)
        var photoCollectionView: mockUICollectionView!
        
        ninthVC.city = "Jack City"  // REMOVE THIS LATER
        ninthVC.store = NinthPhotoStore()  // give the VC a store object
        //ninthVC.photoDataSource = NinthPhotoCollectionViewDataSource()
        
        
        let frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)
        
        photoCollectionView = mockUICollectionView(frame: frame, collectionViewLayout: layout)
        photoCollectionView.dataSource = NinthPhotoCollectionViewDataSource()

    
        let index = IndexPath(row: 0, section: 0)
       // photoCollectionView.selectItem(at: index, animated: false, scrollPosition: UICollectionViewScrollPosition(rawValue: UInt(1)))
        
       //let cell =  photoCollectionView.cellForItem(at: index)
       // photoCollectionView.selectItem(at: index, animated: false, scrollPosition: UICollectionViewScrollPosition.left  )
       // photoCollectionView.selectItem(at: index, animated: false, scrollPosition: UICollectionViewScrollPosition.top  )
        
        
        // 2. Action
       controller?.prepare(for: segue, sender: photoCollectionView)
        //controller?.prepare(for: segue, sender: cell)
        
    
        // 3. Assert
        XCTAssertNotNil(segue)
        

    }  // end func
    
    
    
    
    
    
    
    
    // MARK: - Tear Down
    
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    
    
    



}  // end class
