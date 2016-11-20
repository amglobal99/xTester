//
//  NinthDetailViewController.swift
//  xTester
//
//  Created by Dad on 11/4/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


class NinthDetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var store: NinthPhotoStore!
    // ====== This is for tetsing only
    var city:String = ""
    
    

    // when photo loads show a title
    var photo: NinthPhoto! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    
    
    override func viewDidLoad()  {
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
