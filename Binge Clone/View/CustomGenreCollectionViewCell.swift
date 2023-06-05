//
//  CustomGenreCollectionViewCell.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 5/6/23.
//

import UIKit

class CustomGenreCollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet weak var genreButton: UIButton!
    @IBOutlet weak var genreBackgroundView: UIView!
    @IBOutlet weak var genreLabel: UILabel!
    
    static let identifier = "CustomGenreCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        genreButton.setTitle("fdsdfds", for: .normal)
//
        genreBackgroundView.layer.borderWidth = 1
        genreBackgroundView.layer.cornerRadius = 8
        genreBackgroundView.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
    }
    
    func setup( buttonTitle: String) {
//        genreButton.setTitle(buttonTitle, for: .normal)
        genreLabel.text = buttonTitle
    }

//    @IBAction func genrePressed(_ sender: Any) {
//        
//        
//    }
    
}
