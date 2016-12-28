//
//  TwelfthA2ViewControllerTests.swift
//  xTester
//
//  Created by Dad on 12/22/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import XCTest
@testable import xTester




class TwelfthA2ViewControllerTests: BaseTestCase {
    
  
  var twelfthA2VC: TwelfthA2ViewController!
  var twelfthA2DetailVC:  TwelfthA2DetailViewController!
  var window: UIWindow!
  

  // MARK: - Setup
  
  override func setUp() {
    super.setUp()
    window = UIWindow()
    setupCreateTwelfthA2ViewController()
    
    
    self.twelfthA2VC.loadView()
    self.twelfthA2VC.viewDidLoad()
    
  }
  

  func setupCreateTwelfthA2ViewController() {
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "TwelfthA", bundle: bundle)
    twelfthA2VC = storyboard.instantiateViewController(withIdentifier: "TwelfthA2")  as! TwelfthA2ViewController
    twelfthA2DetailVC = storyboard.instantiateViewController(withIdentifier: "TwelfthA2Detail")  as! TwelfthA2DetailViewController
    
    addViewToWindow()
  }
  
  
  func addViewToWindow()   {
    window.addSubview(twelfthA2VC.view)
    RunLoop.current.run(until: Date())
  }
  
  
  
  // MARK: - Availability Tests
  
  func testThatTwelfthA2ViewControllerIsAvailable() {
    XCTAssertNotNil(twelfthA2VC )
  }
  
  
  
  func testThatCollectionView1DataSourceIsAvailable() {
    XCTAssertNotNil(twelfthA2VC.collectionView1DataSource )
  }
  
  
  func testThatCollectionView2DataSourceIsAvailable() {
    XCTAssertNotNil(twelfthA2VC.collectionView2DataSource )
  }
  
  
  func testThatCollectionView3DataSourceIsAvailable() {
    XCTAssertNotNil(twelfthA2VC.collectionView3DataSource )
  }
  
  func testThatQueue2IsAvailable() {
    XCTAssertNotNil(twelfthA2VC.queue2 )
  }
  
  func testThatQueue3IsAvailable() {
    XCTAssertNotNil(twelfthA2VC.queue3 )
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
