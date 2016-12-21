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
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // THis is our segue to the TwelfthA1 and TwelfthA2 controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  identifier = segue.identifier
        let segIdentifier = SegueIdentifier(rawValue: identifier!)
        switch segIdentifier! {
            case .TwelfthA1Segue:
                print("Selecte TwelfthA1ViewController")
            case .TwelfthA2Segue:
                
                let twelfthA2VC = segue.destination  as! TwelfthA2ViewController
                
                
                /*
                 Instaed of setting store value here, we will do it in the Class Constructor /Initializer.
                 If needed, UNCOMMENT lines below and thta will work too.
 
                //twelfthA2VC.store = TwelfthA2CollectionView3PhotoStore()  // give the VC a store object
                //twelfthA2VC.collectionView1DataSource = TwelfthA2CollectionView1DataSource()
                //twelfthA2VC.collectionView3DataSource = TwelfthA2CollectionView3DataSource()
           
            
                // twelfthA2VC.tableviewDataSource = TwelfthA2TableViewDataSource()
                // twelfthA2VC.tableviewDelegate = TwelfthA2TableViewDataSource()
             
                */
            
            
            
            
            
        
        }  // end switch
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}  // end class
