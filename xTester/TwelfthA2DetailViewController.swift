//
//  TwelfthA2DetailViewController.swift
//  xTester
//
//  Created by Dad on 11/10/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


/// This ViewController displays the Photo detail image.
/// The class conforms to the Utils protocol.

class TwelfthA2DetailViewController: UIViewController, Utils {
    
  // Create an outlet to the ImageView
    @IBOutlet weak var imageView: UIImageView!
  
  // Create a reference to a Photo store
    var store: TwelfthA2CollectionView3PhotoStore!
  
    // when photo loads show a title
    var photo: TwelfthA2Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
  
    override public func viewDidLoad()  {
        super.viewDidLoad()
       // The value of photo var is set during segue. Now all we do is fetch that photo
        store.fetchImageForPhoto(photo)
        { [weak self] result in
            switch result {
            case let .success(image):
                OperationQueue.main.addOperation() {
                  guard let strongSelf = self else {
                    return
                  }
                    strongSelf.imageView.image = image
                }
            case let .failure(error):
                print("Error fetching image for photo : \(error) " )
            } //end switch
        } //end closure
 
    }  //end viewDidLoad
    
  
}  // end class
