//
//  CustomGenreCollectionViewCell.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 5/6/23.
//

import UIKit

class CustomGenreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var genreBackgroundView: UIView!
    @IBOutlet weak var genreLabel: UILabel!
    
    static let identifier = "CustomGenreCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }
    
    private func setupView() {
        genreBackgroundView.layer.borderWidth = 1
        genreBackgroundView.layer.cornerRadius = 8
        genreBackgroundView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor //white
    }
    
    func selected() {
        genreBackgroundView.backgroundColor = UIColor(red: 0.898, green: 0.035, blue: 0.078, alpha: 1) //red
        genreBackgroundView.layer.borderWidth = 0
    }
    
    func deSelected() {
        genreBackgroundView.backgroundColor = .black
        genreBackgroundView.layer.borderWidth = 1
    }
    
    func setup( label: String) {
        genreLabel.text = label
    }

    
}
