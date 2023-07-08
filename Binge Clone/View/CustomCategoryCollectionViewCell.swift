//
//  CustomCategoryCollectionViewCell.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 26/6/23.
//

import UIKit

class CustomCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryBackgroundView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    static let identifier = "CustomCategoryCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }
    
    private func setupView() {
        categoryBackgroundView.layer.cornerRadius = 5
        categoryBackgroundView.backgroundColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1) //white
    }
    
    func setup( image: String) {
        categoryImageView.image = UIImage(named: image)
    }

}
