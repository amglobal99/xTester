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




class NinthCollectionViewCell: UICollectionViewCell {
    
    
    /*
    
    
    @IBOutlet weak var testLabel: UILabel!
 
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    
    
    func updateWithImage(_ image: UIImage?) {
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

    
    
    */
    
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var closeButtonView: UIVisualEffectView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!

    var delegate: NinthPhotoCollectionViewCellDelegate?
    
    var ninthPhoto: NinthPhoto? {
        didSet {
            //print("Publishre Cell .. someone is setting cell publisher value ..")
            updateUI()
        }
    }
    
    var editing: Bool = false {
        didSet {
            closeButtonView.isHidden = !editing
        }
    }
    
    
    @IBAction func deleteButtonClicked() {
        print("Deleting this publisher ...")
        // delegate?.deletePublisher(ninthPhoto!)
    }
    
    
    
    func updateUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 3.0
        photoImageView.image = ninthPhoto?.image
        photoTitleLabel.text = ninthPhoto?.title
        closeButtonView.layer.masksToBounds = true
        closeButtonView.layer.cornerRadius = closeButtonView.bounds.width / 2
    }
    
    
    var snapshot: UIView {
        get {
            let snapshot = snapshotView(afterScreenUpdates: true)
            let layer = snapshot?.layer
            layer?.masksToBounds = false
            layer?.shadowOffset = CGSize(width: -2.5, height: 0.0)
            layer?.shadowRadius = 3.0
            layer?.shadowOpacity = 0.4
            return snapshot!
        }
    }
    
    var dragging: Bool = false {
        didSet {
            let alpha: CGFloat = dragging ? 0.0 : 1.0
            photoImageView.alpha = alpha
            photoTitleLabel.alpha = alpha
            visualEffectView.alpha = alpha
        }
    }
    
    deinit {
        print("PublishersCollectionViewCell: Object being DEINITIALIZED")
    }
    
    
    
}  // end class
