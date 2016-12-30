//
//  TwelfthA2ViewControllerTests.swift
//  xTester
//
//  Created by Dad on 12/22/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import XCTest
import SwiftyJSON
import Alamofire
@testable import xTester




class TwelfthA2ViewControllerTests: BaseTestCase {
    
  
  var viewControllerUnderTest: TwelfthA2ViewController!
  var viewControllerUnderTestDetailVC:  TwelfthA2DetailViewController!
  //var window: UIWindow!
  

  // MARK: - Setup
  
  override func setUp() {
    
        super.setUp()
        //window = UIWindow()
  
        //get the storyboard the ViewController under test is inside
        let storyboard = UIStoryboard(name: "TwelfthA", bundle: Bundle.main)
    
        //get the ViewController we want to test from the storyboard (note the identifier is the id explicitly set in the identity inspector)
        viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "TwelfthA2")  as! TwelfthA2ViewController
        viewControllerUnderTestDetailVC = storyboard.instantiateViewController(withIdentifier: "TwelfthA2Detail")  as! TwelfthA2DetailViewController
    
    
        //window.addSubview(viewControllerUnderTest.view)
        //RunLoop.current.run(until: Date())
    
    
        //load view hierarchy
        _ = viewControllerUnderTest.view
        
  } // end setup
  

  
  
  
  
  
  // Mark: - Helper Methods
  
  func segues(ofViewController viewController: UIViewController) -> [String] {
    // NOTE: The value property is UNDOCUMENTED. App Store will REJECT. Change this later
    let identifiers = (viewController.value(forKey: "storyboardSegueTemplates") as? [AnyObject])?.flatMap({ $0.value(forKey: "identifier") as? String }) ?? []
    return identifiers
  }
  
  
  
  
  // MARK: - Storyboard Segues
  
  
  func testSegues() {
    let identifiers = segues(ofViewController: viewControllerUnderTest)
    XCTAssertEqual(identifiers.count, 1, "Segue count should equal one.")
    XCTAssertTrue(identifiers.contains("ShowTwelfthA2PhotoDetail"), "Segue ShowTwelfthA2PhotoDetail should exist.")
  }
  
  
  
  
  
  func testThatButtonTransitionsToDetailViewController() {
    
    // 1. Arrange
    class MockController: TwelfthA2ViewController {
      
      var segueIdentifier: String?
      
      func performSegueWithIdentifier(identifier: String?, sender: AnyObject?) {
        print("performSegueWithIDentifier.....")
        segueIdentifier = identifier
      }
  
      private override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         print("From Mock classs .... prepareforsegue")
      }
      
    }  // end Mock class

    
  
    let controller = MockController(nil)
    
    // 2. Act
    controller.performSegueWithIdentifier(identifier: "ShowTwelfthA2PhotoDetail", sender: nil)
    
    // 3. Assert
    if let identifier = controller.segueIdentifier {
      XCTAssertEqual("ShowTwelfthA2PhotoDetail", identifier)
    }
    else {
      XCTFail("Segue should be performed")
    }
    
    
  }  // end func
  
  
  
  
  
  func testThatPrepareForSegueIsOK () {
    
    class MockController: TwelfthA2ViewController {
      
      var segueIdentifier: String?
  
      private override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("From Mock classs .... prepareforsegue")
      }
      
    }  // end Mock class
    

    
     let controller = MockController(nil)
     let destVC: TwelfthA2DetailViewController = TwelfthA2DetailViewController()
      let segue = UIStoryboardSegue(identifier: "ShowTwelfthA2PhotoDetail", source: controller, destination: destVC)
     controller.prepare(for: segue, sender: nil)
  
     XCTAssertNotNil(segue)
    
  } // end func
  
  
  
  
  
  /*
  func testThatPrepareForSegueOriginalIsOK () {
    
    let destVC: TwelfthA2DetailViewController = TwelfthA2DetailViewController()
    let segue = UIStoryboardSegue(identifier: "ShowTwelfthA2PhotoDetail", source: viewControllerUnderTest, destination: destVC)
    viewControllerUnderTest.prepare(for: segue, sender: nil)
  
    XCTAssertNotNil(segue)
  
  } // end func
  
  
  */
  

  
  
  
  
  
  
  // MARK: - Method Tests
  
  func testThatGetSiteURLMethodReturnsValidUrl () {
    let siteName = "BIKENYC"
    let site =  Constants.Configuration.TestSite(rawValue: siteName)
    let url = self.getSiteURL(baseURLString: (site?.urlString)!, method: site?.method, parameters: site?.params, apiKey: site?.apiKey)
    XCTAssertNotNil(url)
  }
  
  
  
  
  
  
  
  func testThatGetJSONObjectMethodReturnsSuccessResultWithValidJSONObject() {
    
    var jsonObject:JSON?
    let siteName = "BIKENYC"
    //let siteName = "FLICKR"
    let site =  Constants.Configuration.TestSite(rawValue: siteName)
    
    //Step 1 ...... Create a expectation
    let expectation = self.expectation(description: "request should succeed")
    
    let urlString = self.getSiteURL(baseURLString: (site?.urlString)!, method: site?.method, parameters: site?.params, apiKey: site?.apiKey)
    
    //var response: DefaultDataResponse?
    //weak var weakSelf = self
    let completionHandler: (Result<JSON>) -> Void  =
      {   resp in
        jsonObject = resp.value!
        print("Result JSON from Completion Handler: \n \(jsonObject) ")
        expectation.fulfill()   // Step 2 ...... In the completion handler, call fulfill method
    } // end closure
    
    getJSONObject(for: urlString!, rootPath: site?.rootPath, completionHandler: completionHandler)  // get a SwiftyJSON object
    
    waitForExpectations(timeout: timeout, handler: nil)
    XCTAssertNotNil(jsonObject )
  } // end func
  
  
  
  
  

  
  
  func testThatTestSite2IsInvalid() {
    
    
    class Mock: TwelfthA2ViewController {
    
      var testSite2: Constants.Configuration.TestSite?
      
      private override func viewDidLoad() {
        print("FROM OVERRIDDEN viewDidLoad")
        testSite2Name = "jack"
        testSite2 = Constants.Configuration.TestSite(rawValue: testSite2Name)
        
      }
      
      override init( _ coder: NSCoder? = nil  ) {
        //super.init()
      }
      
    } // end Mock
    
    
    
    let mock = Mock(nil)
    _ = mock.view
    
    XCTAssertNil(mock.testSite2)
    
    
    
    
  } // end func
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   func testThatTestSite2IsNotNil () {
      let siteName = "BIKENYC"
      let site =  Constants.Configuration.TestSite(rawValue: siteName)
      XCTAssertNotNil(site)
  }
  
  
  func testThatTestSite3IsNotNil () {
    let siteName = "FLICKR"
    let site =  Constants.Configuration.TestSite(rawValue: siteName)
    XCTAssertNotNil(site)
  }
  
  
  
  
  func testThatInvalidSite2NameFails () {
    viewControllerUnderTest.testSite2Name = "xx"
    
    viewControllerUnderTest.viewDidLoad()
    
    
    XCTAssertNotNil(viewControllerUnderTest.testSite3Name)
    
  
  }
  
  
  
  
  
  // MARK: - Availability Tests
  
  func testThatTwelfthA2ViewControllerIsAvailable() {
    XCTAssertNotNil(viewControllerUnderTest )
  }
  
  
  
  func testThatCollectionView1DataSourceIsAvailable() {
    XCTAssertNotNil(viewControllerUnderTest.collectionView1DataSource )
  }
  
  
  func testThatCollectionView2DataSourceIsAvailable() {
    XCTAssertNotNil(viewControllerUnderTest.collectionView2DataSource )
  }
  
  
  func testThatCollectionView3DataSourceIsAvailable() {
    XCTAssertNotNil(viewControllerUnderTest.collectionView3DataSource )
  }
  
  func testThatQueue2IsAvailable() {
    XCTAssertNotNil(viewControllerUnderTest.queue2 )
  }
  
  func testThatQueue3IsAvailable() {
    XCTAssertNotNil(viewControllerUnderTest.queue3 )
  }
  
  
  
  
  
  
 /*

  func testThatUpdateDestinationDataIsAvailable() {
    
    let index = IndexPath(row: 1 , section: 1)
    twelfthA2VC.updateDestinationData(destinationVC: twelfthA2DetailVC, indexPath: index)
    
    //XCTAssertNotNil( twelfthA2DetailVC.photo)
    
    XCTAssertNotNil( twelfthA2VC.collectionView3DataSource )
    
    
    
    
  }
  
  */
  
  
  
  
}  // end class
