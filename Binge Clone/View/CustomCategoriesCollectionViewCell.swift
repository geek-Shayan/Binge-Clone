//
//  CustomCategoriesCollectionViewCell.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 15/6/23.
//

import UIKit

class CustomCategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryBackgroundView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifier = "CustomCategoriesCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }
    
    private func setupView() {
        categoryBackgroundView.layer.cornerRadius = 8
    }
    
    func setup( label: String) {
        categoryLabel.text = label
    }

}
