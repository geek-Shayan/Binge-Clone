//
//  HeaderCollectionReusableView.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 23/5/23.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    static let headerIdentifier = "header"
    
    private let header: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
//        label.font = .preferredFont(forTextStyle: .subheadline)
//        label.text = "Category"
//        label.backgroundColor = .darkGray
        
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        header.backgroundColor = .opaqueSeparator
        addSubview(header)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//       super.awakeFromNib()
//       //custom logic goes here
//        addSubview(header)
//    }

    override func layoutSubviews() {
        header.frame = bounds
    }
    
    func setup(head: String) {
        header.text = head
    }
}






//TESTS FOR COMP LAYOUT


//            if (sectionNumber == 0) {
                
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//                item.contentInsets.trailing = 2
////                item.contentInsets.bottom = 8
//
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(480)), subitems: [item])
//
//                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .groupPaging
//
//                section.visibleItemsInvalidationHandler = { (items, offset, environment) in
//                    items.forEach { item in
//                        let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
//                        let minScale: CGFloat = 0.8
//                        let maxScale: CGFloat = 1.0 - (distanceFromCenter / environment.container.contentSize.width)
//                        let scale = max(maxScale, minScale)
//                        item.transform = CGAffineTransform(scaleX: scale, y: scale)
//                    }
//                }
//                return section
//            }
        
            
//            else if (sectionNumber == 1) {
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//                item.contentInsets.trailing = 16
//                item.contentInsets.bottom = 8
//
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(150)), subitems: [item])
//
//                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .continuous
//                section.contentInsets.leading = 16
//
//                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
//                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
//
//                section.boundarySupplementaryItems = [header] //, footer
//
//                return section
//
//
//            }
            
            
//            else if (sectionNumber == 2) {
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//                item.contentInsets.trailing = 16
//                item.contentInsets.bottom = 8
//
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(120), heightDimension: .absolute(120)), subitems: [item])
//
//                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .continuous
//                section.contentInsets.leading = 16
//
//                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
//                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
//
//                section.boundarySupplementaryItems = [header] //, footer
//
//                return section
//
//
//            }

            
//            else if (sectionNumber == 3) {
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//                item.contentInsets.trailing = 16
//                item.contentInsets.bottom = 8
//
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.66), heightDimension: .absolute(140)), subitems: [item])
//
//                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .groupPaging
//                section.contentInsets.leading = 16
//
//                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
////                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
//
//                section.boundarySupplementaryItems = [header] //, footer
//
//                return section
//            }
//

            
//            else {
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)))
//                item.contentInsets.trailing = 16
//                item.contentInsets.bottom = 8
//
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
//
//                let section = NSCollectionLayoutSection(group: group)
//                section.contentInsets = .init(top: 0, leading: 16, bottom: -8, trailing: 0)
//
//                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topTrailing)
//                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomTrailing)
//
//                section.boundarySupplementaryItems = [header, footer]
//
//                return section
//            }
