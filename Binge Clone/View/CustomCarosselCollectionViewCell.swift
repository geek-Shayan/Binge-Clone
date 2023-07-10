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
    
    @IBOutlet weak var carosselPageControl: UIPageControl!
    
    static let identifier = "CustomCarosselCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }
    
    private func setupView() {
//        carosselBackgroundView.backgroundColor = .red
        carosselPageControl.currentPage = 0
    }
    
    func setup(image: String, indexPath: IndexPath, dataSize: Int) {
        carosselImageView.image = UIImage(named: image)
        carosselPageControl.currentPage = indexPath.item
        carosselPageControl.numberOfPages = dataSize
    }
}
