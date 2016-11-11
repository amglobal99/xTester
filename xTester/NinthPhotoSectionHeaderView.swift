//
//  NinthPhotoSectionHeaderView.swift
//  xTester
//
//  Created by Dad on 11/11/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation
import UIKit

class NinthPhotoSectionHeaderView: UICollectionReusableView  {
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    /*
    var publisher: Publisher? {
        didSet {
            sectionLabel.text = publisher?.section.uppercased()
        }
    }
    
    */
    
    
    var photo: NinthPhoto? {
        didSet {
           // sectionLabel.text = publisher?.section.uppercased()
            sectionLabel.text = String("jack").uppercased()

        }
    }
    
    
    
    
    
}

