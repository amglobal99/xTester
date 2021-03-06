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
    @IBOutlet weak var photoIDLabel: UILabel!
    @IBOutlet weak var photoServerLabel: UILabel!
    
    
    
    @IBAction func buyPhotoItem(_ sender: AnyObject) {
        
        let optionMenu = UIAlertController(title: nil, message: "Purchase Confirmaton Required ", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Buy", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Purchase will be made")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        
        self.parentViewController?.present(optionMenu, animated: true, completion: {
            print("completed presenting alert.....")
            }
        )

    } // end action
    
    
    
    func updateWithImage(_ image: UIImage?) {
        if let imageToDisplay = image {
            spinner .stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner .startAnimating()
            imageView.image = nil
        }
    }  //end method
    
  
  
  
  
  
  /*
  
    override func awakeFromNib() {
        super.awakeFromNib()
        updateWithImage(nil )
    }
    
    

    
    // called when cell is being reused
    override func prepareForReuse() {
        //print("             super.prepareforReuse")
        super.prepareForReuse()
        updateWithImage(nil )
    }

    */
  
  
  
  
  
  
    
}  // end class
