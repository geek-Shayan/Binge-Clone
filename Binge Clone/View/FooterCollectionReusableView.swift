//
//  FooterCollectionReusableView.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 23/5/23.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
        
    static let footerIdentifier = "footer"
    
    private let footer: UILabel = {
        let label = UILabel()
//        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.font = .preferredFont(forTextStyle: .subheadline)
//        label.textAlignment = .center
//        label.text = "Category"
//        label.backgroundColor = .darkGray
        
        return label
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.style = UIActivityIndicatorView.Style.large
//        indicator.startAnimating()
        
        return indicator
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        footer.backgroundColor = .opaqueSeparator
        addSubview(footer)
        addSubview(loadingIndicator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        footer.frame = bounds
        loadingIndicator.frame = CGRect(x: footer.frame.midX - 18, y: footer.frame.midY, width: 20, height: 20)
    }
    
    func setup(foot: String, indicatorFlag: Bool) {
        footer.text = foot
        indicatorFlag ? loadingIndicator.startAnimating() : loadingIndicator.stopAnimating()
    }
}
