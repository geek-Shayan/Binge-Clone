//
//  CustomCarosselCollectionViewCell.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 13/6/23.
//

import UIKit

class CustomCarosselCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var carosselBackgroundView: UIView!
    
    @IBOutlet weak var carosselImageView: UIImageView!
    
    @IBOutlet weak var carosselTopGradientImageView: UIImageView!
    
    @IBOutlet weak var carosselBottomGradientImageView: UIImageView!
    
    static let identifier = "CustomCarosselCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        carosselBackgroundView.backgroundColor = .red
    }

    
    func setup(image: String) {
        carosselImageView.image = UIImage(named: image)
    }
}
