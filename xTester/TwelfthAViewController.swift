//
//  SixteenthViewController.swift
//  xTester
//
//  Created by Dad on 10/28/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit

class TwelfthAViewController: UIViewController, Utils{
    
    
    
    enum SegueIdentifier:String  {
        case TwelfthA1Segue
        case TwelfthA2Segue
    }
    
    
    

    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
                
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let  identifier = segue.identifier
        let segIdentifier = SegueIdentifier(rawValue: identifier!)
        
        switch segIdentifier! {
        case .TwelfthA1Segue:
            print("A1")
        case .TwelfthA2Segue:
            print("A2")
            //let twelfthA2VC = segue.destination  as! TwelfthA2ViewController
            //twelfthA2VC.store = TwelfthA2CollectionView3PhotoStore()  // give the VC a store object
            //twelfthA2VC.photoDataSource = TwelfthA2CollectionView3DataSource()
       
           let twelfthA2VC = segue.destination  as! TwelfthA2ViewController
           twelfthA2VC.store = TwelfthA2CollectionView3PhotoStore()  // give the VC a store object
           twelfthA2VC.photoDataSource = TwelfthA2CollectionView3DataSource()
            twelfthA2VC.city = "Sangli"
            
            
        
        
        
        
        }  // end switch
    
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
}  // end class
