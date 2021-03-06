//
//  FirstViewController.swift
//  xxxDump
//
//  Created by Dad on 5/2/16.
//  Copyright © 2016 Dad. All rights reserved.
//

import Foundation
import UIKit
import BRYXBanner


class FirstViewController: UIViewController, Utils {
   
   
   
   
   deinit  {
      print("FirstViewController: VC being deinitialized.")
   }
   
   
   
    enum SegueIdentifier:String  {
        case SecondSegue
        case ThirdSegue
        case FourthSegue
        case FifthSegue
        case SixthSegue
        case SeventhSegue
        case EighthSegue
        case NinthSegue
        case TenthSegue
        case EleventhSegue
        case TwelfthSegue
        case ThirteenthSegue
        case FourteenthSegue
        case FifteenthSegue
        case DucTranSegue
    }
    
    
    
    
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            NSLog("Popular selected")
        //show popular view
        case 1:
            NSLog("History selected")
        //show history view
        case 2:
            NSLog("Third View")
                   default:
            break;
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      print("test")
      
      
        // Let's check if Internet connection is available
        
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            
            displayAlert( "Action Required", message: "No Internet Connetion. \nClick home button to quit app.", buttonText: "OK")
            
            return
            
        }
        
        
        
        
    }
    
    
    
    
    // ======= Use this method to assign values to variables
    // in the destination VC
    // This is a good way to do Dependency Injection
    //
    // ========================================================
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
       print("FirstVC: executing segue.")
      
        let  identifier = segue.identifier
        let segIdentifier = SegueIdentifier(rawValue: identifier!)
        
        switch segIdentifier! {
        case .SecondSegue:
            print("2😈")
        case .ThirdSegue:
            // As you enter ThirdViewController, set its delegateForMaster property
            // to be an insnace of  ThirdViewControllerTableVC.swift
            // Whihc means this controller will serve as the MAin controller's delegate.
            // This allows us to execute function within the ThirdViewControllerTableVC.swift class
            print("Segue 3👼")
            // ++++++++THIS DOE NOT WORK ++++++++++++++++++++++++
            // THIS INSTANCE IS DIFFERENT THAN ONE CREATE DAFTER SEGUE. SO NO ACCES TO FIELD VALUES
            //let thirdVC = segue.destination  as! ThirdViewController
            // thirdVC.delegateForMaster = ThirdViewControllerTableVC()
            
            /*
             // THIS DID NOT WORK
            let source  = ThirdViewController() as? UIViewController
            let dest = ThirdViewControllerTableVC() as? UIViewController
            let segue = UIStoryboardSegue(identifier: "CompanyFormSegue", source: source!, destination: dest!)
            thirdVC.delegateForMaster = segue.destination as? ThirdViewControllerTableVC
            */
            
            
            
            
        case .FourthSegue:
            print("4😈")
        case .FifthSegue:
            print("5😈")
        case .SixthSegue:
            print("6😈")
        case .SeventhSegue:
            print("7😈")
        case .EighthSegue:
            print("8😈")
        case .NinthSegue:
            // We will use this section to inject Propery values in NinthViewController
            let ninthVC = segue.destination  as! NinthViewController
            ninthVC.store = NinthPhotoStore()  // give the VC a store object
            ninthVC.photoDataSource = NinthPhotoCollectionViewDataSource()
            
        case .TenthSegue:
            print("10😈")
        case .EleventhSegue:
            print("11😈")
        case .TwelfthSegue:
            print("12😈")
        case .ThirteenthSegue:
            print("13😈")
            // Set the delegate value in ViewController
             let thirteenthVC = segue.destination  as! ThirteenthViewController
            thirteenthVC.delegateForMaster = ThirteenthViewControllerDestination()
            
            
            
        case .FourteenthSegue:
            print("14😈")
        case .FifteenthSegue:
            print("15😈")
        case .DucTranSegue:
            print("duc")
        }  // end switch
               
        
    } // end func
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}  // end class

