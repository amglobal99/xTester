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
   
   
   
   deinit {
      print("TwelfthAViewController: VC is being deinitialized")
   }
   
   

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
   // Instead of using a segue, we can use a Button IBAction to open a new VController
   // This allows us to run the custome initializer.
   // We can initialize a lot of stuff in that Initializer
    
    
    let store1 = TwelfthA2CollectionView1PhotoStore()
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
      
      
      print("TwelfthAViewController: Executing segue")
      
        let  identifier = segue.identifier
        let segIdentifier = SegueIdentifier(rawValue: identifier!)
        switch segIdentifier! {
            case .TwelfthA1Segue:
                print("Selected TwelfthA1ViewController")
            case .TwelfthA2Segue:
                 print("prepareForsegue: TwelfthAViewController : Selected TwelfthA2ViewController segue.")
                 let destVC = segue.destination  as! TwelfthA2ViewController
                 // set properties on destination VC here
                 destVC.store1 = TwelfthA2CollectionView1PhotoStore()
                 destVC.store2 = TwelfthA2CollectionView2PhotoStore()
                 destVC.store3 = TwelfthA2CollectionView3PhotoStore()
                 destVC.collectionView1DataSource = TwelfthA2CollectionView1DataSource()
                 destVC.collectionView2DataSource = TwelfthA2CollectionView2DataSource()
                 destVC.collectionView3DataSource = TwelfthA2CollectionView3DataSource()
                 destVC.tableviewDataSource = TwelfthA2TableViewDataSource()
                 destVC.tableviewDelegate =  TwelfthA2TableViewDataSource()
         
                 // Inject value for store property in the CollectionView data sources
                 destVC.collectionView2DataSource.photoStore = TwelfthA2CollectionView2PhotoStore()
                 destVC.collectionView3DataSource.photoStore = TwelfthA2CollectionView3PhotoStore()
         
                 //(table.delegate as! TwelfthA2TableViewDataSource ).collectionView1DataSource = (self.collectionView1DataSource)!
                 //(table.delegate as! TwelfthA2TableViewDataSource ).collectionView2DataSource = (self.collectionView2DataSource)!
                 //(table.delegate as! TwelfthA2TableViewDataSource ).collectionView3DataSource = (self.collectionView3DataSource)!
         
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
    } // end func
    
    
   

    
}  // end class
