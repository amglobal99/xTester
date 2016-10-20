//
//  FourteenthViewController.swift
//  xTester
//
//  Created by Dad on 10/18/16.
//  Copyright © 2016 Natsys. All rights reserved.
//


import Foundation
import UIKit
import Alamofire





class FourteenthViewController: UIViewController {
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            
            let urlString = "https://jsonplaceholder.typicode.com/todos"
            Alamofire.request(urlString).response { response in
                debugPrint(response)
            }
           
            
        } // end func
        
    
    
    
    
    
    
    
    
    
    
    
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        

        
        
        
        

    
    
    
    
}  // end class

