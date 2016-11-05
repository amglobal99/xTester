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
    
    // when photo loads show a title
    var ninthPhoto: NinthPhoto! {
        didSet {
            navigationItem.title = ninthPhoto.title
        }
    }
    
    var store: PhotoStore!
    
    
    
    override func viewDidLoad()  {
        
        super.viewDidLoad()
        print("NinthDetailViewControler.swift: Calling fetchImageForPhoto (PhotoStore.swift) ")
        
        
        /*
        store.fetchImageForPhoto(photo) {  // begin closure
            (result) -> Void in
            switch result {
            case let .success(image):
                OperationQueue.main.addOperation() {
                    self.imageView.image = image
                }
            case let .failure(error):
                print("Error fetching image for photo : \(error) " )
            } //end swith
            
        } //end closure
        */
        
        
        
        
        
        
        
        
    }  //end method
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
