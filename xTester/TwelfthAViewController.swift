//
//  SixteenthViewController.swift
//  xTester
//
//  Created by Dad on 10/28/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit

class TwelfthAViewController: UIViewController, Utils {
    

    enum SegueIdentifier:String  {
        case TwelfthA1Segue
        case TwelfthA2Segue
        case TwelfthA3Segue
        case TwelfthA4Segue
         case TwelfthA5Segue
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
  
  
  
  
  
  @IBAction func displayTwelfthA2VC(_ sender: AnyObject) {
    
    
    // +++++++++++++++ THIS IS NOT WORKING .  NEEDS TO BE FIXED ++++++++++++++++++++++++
    
    
    
    let store2 = TwelfthA2CollectionView2PhotoStore()
    let store3 = TwelfthA2CollectionView3PhotoStore()
    
    /*
    let collectionView1DataSource = TwelfthA2CollectionView1DataSource()
    let collectionView2DataSource = TwelfthA2CollectionView2DataSource()
    let collectionView3DataSource = TwelfthA2CollectionView3DataSource()
    let tableviewDataSource = TwelfthA2TableViewDataSource()
    let tableviewDelegate =   TwelfthA2TableViewDataSource()
    let collview2PhotoStore = TwelfthA2CollectionView2PhotoStore()
    let collview3PhotoStore = TwelfthA2CollectionView3PhotoStore()
 
    
   
    let vc = TwelfthA2ViewController(store2: store2,
                                     store3: store3,
                                     collectionView1DataSource: collectionView1DataSource,
                                     collectionView2DataSource: collectionView2DataSource,
                                     collectionView3DataSource: collectionView3DataSource,
                                     tableviewDataSource: tableviewDataSource,
                                     tableviewDelegate:   tableviewDelegate,
                                     collview2PhotoStore: collview2PhotoStore,
                                     collview3PhotoStore: collview3PhotoStore )
    
    */
    
    
    
    
    /*
   
     let   collectionView1DataSource = TwelfthA2CollectionView1DataSource()
     var collectionView2DataSource = TwelfthA2CollectionView2DataSource()
     var collectionView3DataSource = TwelfthA2CollectionView3DataSource()
     let tableviewDataSource = TwelfthA2TableViewDataSource()
     let tableviewDelegate =   TwelfthA2TableViewDataSource()
     let collview2PhotoStore = TwelfthA2CollectionView2PhotoStore()
     let collview3PhotoStore = TwelfthA2CollectionView3PhotoStore()
     
    
    
    
    let vc = TwelfthA2ViewController(store2: store2, store3: store3, collectionView1DataSource: TwelfthA2CollectionView1DataSource(),
                                     collectionView2DataSource: TwelfthA2CollectionView2DataSource(),
                                     collectionView3DataSource: TwelfthA2CollectionView3DataSource(),
                                     tableviewDataSource: TwelfthA2TableViewDataSource(),
                                     tableviewDelegate:   TwelfthA2TableViewDataSource(),
                                     collview2PhotoStore: TwelfthA2CollectionView2PhotoStore(),
                                     collview3PhotoStore: TwelfthA2CollectionView3PhotoStore()
    )
    
    
      
    
    // present VC
    self.navigationController?.pushViewController(vc, animated: true)
    
    
    */
    
    
    
    
    
    
    
  }  // end IBAction
  
  
  
  
  
  
  
    
    // THis is our segue to the TwelfthA1 and TwelfthA2 controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  identifier = segue.identifier
        let segIdentifier = SegueIdentifier(rawValue: identifier!)
        switch segIdentifier! {
            case .TwelfthA1Segue:
                print("Selected TwelfthA1ViewController")
            case .TwelfthA2Segue:
                 print("prepareForsegue: TwelfthAViewController : Selected TwelfthA2ViewController segue.")
                 // TwelfthA2ViewController.doSomething()   // used juts for testing
                // let destVC = segue.destination  as! TwelfthA2ViewController
                 let _ = segue.destination  as! TwelfthA2ViewController
        case .TwelfthA3Segue:
              print("prepareForsegue: TwelfthAViewController : Selected TwelfthA3ViewController segue.")
                    //let _ = segue.destination  as! TwelfthA3ViewController
        case .TwelfthA4Segue:
          print("prepareForsegue: TwelfthAViewController : Selected TwelfthA4ViewController segue.")
          let _ = segue.destination  as! TwelfthA4ViewController
          
              /*
                 Instaed of setting store value here, we will do it in the Class Constructor /Initializer.
                 If needed, UNCOMMENT lines below and thta will work too.
                //twelfthA2VC.store = TwelfthA2CollectionView3PhotoStore()  // give the VC a store object
                //twelfthA2VC.collectionView1DataSource = TwelfthA2CollectionView1DataSource()
                //twelfthA2VC.collectionView3DataSource = TwelfthA2CollectionView3DataSource(
                // twelfthA2VC.tableviewDataSource = TwelfthA2TableViewDataSource()
                // twelfthA2VC.tableviewDelegate = TwelfthA2TableViewDataSource()
             
                */
          
          case .TwelfthA5Segue:
               let _ =   (segue.destination as! UINavigationController).topViewController as! TwelfthA5ViewController
          

          
          
            }  // end switch
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}  // end class
