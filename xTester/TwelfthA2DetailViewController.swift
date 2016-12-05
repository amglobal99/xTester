//
//  TwelfthA2DetailViewController.swift
//  xTester
//
//  Created by Dad on 11/10/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class TwelfthA2DetailViewController: UIViewController, Utils {
    
        
    @IBOutlet weak var imageView: UIImageView!
    

    var store: TwelfthA2CollectionView3PhotoStore!
    
    

    // when photo loads show a title
    var photo: TwelfthA2Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    
     
    
    
    override public func viewDidLoad()  {
        super.viewDidLoad()
        
       
        store.fetchImageForPhoto(photo)
        { (result) -> Void in
            switch result {
            case let .success(image):
                OperationQueue.main.addOperation() {
                    self.imageView.image = image
                }
            case let .failure(error):
                print("Error fetching image for photo : \(error) " )
            } //end swith
            
        } //end closure
 
 
 
 
        
    }  //end viewDidLoad
    

    
    
    
    
    
    
}  // end class
