//
//  CustomCategoriesCollectionViewCell.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 15/6/23.
//

import UIKit

class CustomCategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryBackgroundView: UIView!
    @IBOutlet weak var categoryBackgroundImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifier = "CustomCategoriesCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }
    
    private func setupView() {
//        categoryBackgroundView.layer.borderWidth = 1
        categoryBackgroundView.layer.cornerRadius = 8
//        categoryBackgroundView.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor //white
    }
    
    func selected() {
//        categoryBackgroundView.backgroundColor = UIColor(red: 0.898, green: 0.035, blue: 0.078, alpha: 1) //red
//        categoryBackgroundView.layer.borderWidth = 0
    }
    
    func deSelected() {
//        categoryBackgroundView.backgroundColor = .black
//        categoryBackgroundView.layer.borderWidth = 1
    }
    
    func setup( label: String) {
        categoryLabel.text = label
    }

}
