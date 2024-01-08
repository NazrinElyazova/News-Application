//
//  OnboardCell.swift
//  News APP
//
//  Created by Nazrin on 04.11.23.
//

import UIKit

class OnboardCell: UICollectionViewCell {
    
    @IBOutlet weak var onboardView: UIView!
    @IBOutlet weak var onboardImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        onboardImage.layer.cornerRadius = 30
    }
}
