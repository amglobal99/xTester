//
//  NinthCollectionViewCell.swift
//  xTester
//
//  Created by Dad on 10/8/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit


protocol NinthPhotoCollectionViewCellDelegate
{
    //func deletePublisher(_ publisher: Publisher)
}




class NinthPhotoCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    
    func updateWithImage(_ image: UIImage?) {
        
        //print("       updateWithImage starting")
        
        
        
        if let imageToDisplay = image {
           //print("       updateWithImage .... image is present")
            //spinner .stopAnimating()
            imageView.image = imageToDisplay
        } else {
           // print("       updateWithImage ..... no Image")
            //spinner .startAnimating()
            imageView.image = nil
            
            
            /*
            let imageName = "Sunset.jpg"
            //let img = UIImage(named: imageName)
            imageView.image = UIImage(named: imageName)
            */
        }
        
        
        
        
        
        
    }  //end method
    
    
    
    
    
    
    
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        updateWithImage(nil )
    }
    
    
    // called when cell is being reused
    override func prepareForReuse() {
        //print("             super.prepareforReuse")
        super.prepareForReuse()
        
        //print( "         Calling updateWithImage from prepareForREuse ")
        updateWithImage(nil )
    }

    
  
    
}  // end class
