//
//  CustomListCollectionViewCell.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 9/7/23.
//

import UIKit

class CustomListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var listBackgroundView: UIView!
    
    @IBOutlet weak var listImage: UIImageView!
    
    @IBOutlet weak var listLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    static let identifier = "CustomListCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }
    
    private func setupView() {
        listBackgroundView.layer.cornerRadius = 10
        listBackgroundView.layer.borderWidth = 2
        listBackgroundView.layer.borderColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1).cgColor
        
        listImage.layer.cornerRadius = 5

    }

    func setup(image: String, title: String, progress: Float = 0.0, hideProgress: Bool = false , duration: String) {
        listImage.image = UIImage(named: image)
        listLabel.text = title
        durationLabel.text = duration

        if hideProgress {
            progressView.isHidden = true
        }
        else {
            progressView.isHidden = false
            progressView.progress = progress
        }
    }

}

