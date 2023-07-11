//
//  CustomSearchListTableViewCell.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 11/7/23.
//

import UIKit

class CustomSearchListTableViewCell: UITableViewCell {

    @IBOutlet weak var listBackgroundView: UIView!
    
    @IBOutlet weak var listImage: UIImageView!
    
    @IBOutlet weak var listLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    static let identifier = "CustomSearchListTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupView() {
        listBackgroundView.layer.cornerRadius = 10
        listBackgroundView.layer.borderWidth = 2
        listBackgroundView.layer.borderColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1).cgColor
        
        listImage.layer.cornerRadius = 5
        
    }
    
    func setup(image: String, title: String, progress: Float, duration: String) {
        listImage.image = UIImage(named: image)
        listLabel.text = title
//        progressView.progress = progress
        durationLabel.text = duration
    }
    
}
