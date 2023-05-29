//
//  CustomActionTableViewCell.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 27/5/23.
//

import UIKit

class CustomActionTableViewCell: UITableViewCell {
    
    static let identifier = "CustomActionTableViewCell"
    
    @IBOutlet weak var actionImage: UIImageView!
    
    @IBOutlet weak var actionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
