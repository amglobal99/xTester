//
//  SectionHeaderView.swift
//  News
//
//  Created by Duc Tran on 7/25/15.
//  Copyright © 2015 Developer Inspirus. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView
{
        
    @IBOutlet weak var sectionLabel: UILabel!
    
    var publisher: Publisher? {
        didSet {
            sectionLabel.text = publisher?.section.uppercased()
        }
    }
    
    
}






















