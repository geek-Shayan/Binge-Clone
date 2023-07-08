//
//  CustomCollectionViewCell.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 23/5/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    private let myImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "bg 4")
//        imageView.backgroundColor = .systemRed
//        imageView.image = UIImage(named: "photo 1")
        imageView.tintColor = .systemMint
        imageView.contentMode = .scaleAspectFill
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 45
//        imageView.layer.borderColor = CGColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 0.50)
//        imageView.layer.borderWidth = 5
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
//        label.text = "Food"
        label.textColor = .lightText
//        label.textColor = .systemMint
//        label.backgroundColor = .separator
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        layer.backgroundColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        layer.cornerRadius = 8
        addSubview(myImage)
        addSubview(myLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        myImage.frame = CGRect(x: 6, y: 6, width: Int(self.frame.width) - 12, height: Int(self.frame.height) - 12)
        myLabel.frame = bounds
    }
    
    func setup(image: String, label: String? = nil) {
        myImage.image = UIImage(named: image)
        myLabel.text = label
    }
}
