//
//  CustomHeaderCollectionReusableView.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 8/7/23.
//

import UIKit

class CustomHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var headerBackgroundView: UIView!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var header: UILabel!
    
    static let headerIdentifier = "CustomHeaderCollectionReusableView"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(head: String, imageFlag: Bool = false) {
        header.text = head
        imageFlag ? (image.isHidden = false) : (image.isHidden = true)
    }
    
}

