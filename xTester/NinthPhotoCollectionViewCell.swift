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
        
        print("      NinthPhotoCollectionViewCell: updateWithImage starting")
        
        if let imageToDisplay = image {
            spinner .stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner .startAnimating()
            imageView.image = nil
        }
    }  //end method
    
    
    
    
    
    
    
    
    
    
    
    // called when cell is first created
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateWithImage(nil )
    }
    
    
    // called when cell is being reused
    override func prepareForReuse() {
        super.prepareForReuse()
        updateWithImage(nil )
    }

    
  
    
}  // end class
