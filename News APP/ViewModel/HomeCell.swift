//
//  HomeCell.swift
//  News APP
//
//  Created by Nazrin on 08.11.23.
//

import UIKit


protocol BookmarkDelegate {
    func addButtonAction(index: Int)
}
class HomeCell: UICollectionViewCell {
    
    let manager = SaveFileManager()
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var homeView: UIView!
    
    var delegate: BookmarkDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        homeView.layer.cornerRadius = 30
        homeImage.layer.cornerRadius = 5
    }
    
    @IBAction func homeButton(_ sender: Any) {
        delegate?.addButtonAction(index: tag)
    }
}
