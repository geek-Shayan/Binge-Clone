//
//  CustomNoResultCollectionViewCell.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 13/7/23.
//

import UIKit

class CustomNoResultCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var noResultBackgroundView: UIView!
    @IBOutlet weak var noResultImageView: UIImageView!
    @IBOutlet weak var noResultLabel: UILabel!
    
    static let identifier = "CustomNoResultCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        setupView()
    }
    private func setupView() {
        noResultBackgroundView.layer.cornerRadius = 8
    }
    
    func setup( label: String) {
        noResultLabel.text = label
        
    }
}
