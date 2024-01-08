//
//  TopicCell.swift
//  News APP
//
//  Created by Nazrin on 07.11.23.
//

import UIKit

class TopicCell: UICollectionViewCell {

    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var cellView: UIView!

    @IBOutlet weak var checkButton: UIButton!
    
    override var isHighlighted: Bool {
        didSet {
            cellView.isHidden = !isHighlighted
        }
    }
    
    @IBAction func checkButtonAction(_ sender: Any) {
    }
    
    override var isSelected: Bool {
        didSet {
            cellView.isHidden = !isSelected
            checkButton.isHidden = !isSelected
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.cornerRadius = 30
    }
}
