//
//  PublisherCollectionViewCell.swift
//  News
//
//  Created by Duc Tran on 7/25/15.
// Copyright © 2015 Developer Inspirus. All rights reserved.
//













import UIKit

protocol PublisherCollectionViewCellDelegate
{
    func deletePublisher(_ publisher: Publisher)
}



class PublisherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var publisherImageView: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var publisherTitleLabel: UILabel!
    @IBOutlet weak var closeButtonView: UIVisualEffectView!
    
    
    var delegate: PublisherCollectionViewCellDelegate?
    
    
    var publisher: Publisher? {
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
        delegate?.deletePublisher(publisher!)
    }
    
    
    
    func updateUI() {
        
       // print("updateUI .... \(publisher?.title)  ")
        
        
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 3.0
        publisherImageView.image = publisher?.image
        publisherTitleLabel.text = publisher?.title
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
            publisherImageView.alpha = alpha
            publisherTitleLabel.alpha = alpha
            visualEffectView.alpha = alpha
        }
    }
    



}  // end class































