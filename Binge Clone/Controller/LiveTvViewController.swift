//
//  LiveTvViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 25/5/23.
//

import UIKit

class LiveTvViewController: UIViewController {
    
    private var sectionHeadersFooters: [supplementaryDataType] = [supplementaryDataType(header: "", footer: ""),
                                                                  supplementaryDataType(header: "Continue Watch", footer: "C"),
                                                                  supplementaryDataType(header: "Exclusive Sports", footer: "E"),
                                                                  supplementaryDataType(header: "Recommended For you", footer: "R"),
                                                                  supplementaryDataType(header: "Originals (Free: Robi Data, Mob App)", footer: ""),
                                                                  supplementaryDataType(header: "Sports", footer: ""),
                                                                  ]

    private var sectionData0: [cellDataType] = [cellDataType(image: "s1", label: "1"),
                                                cellDataType(image: "s1", label: "2"),
                                                cellDataType(image: "s1", label: "3"),
                                                cellDataType(image: "s1", label: "4")]

    private var sectionData1: [cellDataType] = [cellDataType(image: "", label: "1"),
                                                cellDataType(image: "", label: "2"),
                                                cellDataType(image: "", label: "3"),
                                                cellDataType(image: "", label: "4"),
                                                cellDataType(image: "", label: "5"),
                                                cellDataType(image: "", label: "6"),
                                                cellDataType(image: "", label: "7"),
                                                cellDataType(image: "", label: "8")]

    private var sectionData2: [cellDataType] = [cellDataType(image: "Sony Ten 1 1", label: "1"),
                                                cellDataType(image: "Sony Ten 2 1", label: "2"),
                                                cellDataType(image: "Sony Ten 3 1", label: "3"),
                                                cellDataType(image: "Sony Ten 5 1", label: "4"),
                                                cellDataType(image: "Sony Ten 1 1", label: "5"),
                                                cellDataType(image: "Sony Ten 2 1", label: "6"),
                                                cellDataType(image: "Sony Ten 3 1", label: "7"),
                                                cellDataType(image: "Sony Ten 5 1", label: "8")]

    private var sectionData3: [cellDataType] = [cellDataType(image: "Independent-TV_110x110", label: ""),
                                                cellDataType(image: "Bijoy-TV_110x110", label: ""),
                                                cellDataType(image: "Channel-24_110x110", label: ""),
                                                cellDataType(image: "NTV_110x110", label: ""),
                                                cellDataType(image: "Desh-TV_110x110", label: ""),
                                                cellDataType(image: "CHANNEL-I-HD_110x110", label: ""),
                                                cellDataType(image: "RTV-HD_110x110", label: ""),
                                                cellDataType(image: "Ekattor-HD_110x110", label: ""),
                                                cellDataType(image: "Somoy-News_110x110", label: ""),
                                                cellDataType(image: "Independent-TV_110x110", label: ""),
                                                cellDataType(image: "Bijoy-TV_110x110", label: ""),
                                                cellDataType(image: "Channel-24_110x110", label: ""),
                                                cellDataType(image: "NTV_110x110", label: ""),
                                                cellDataType(image: "Desh-TV_110x110", label: ""),
                                                cellDataType(image: "CHANNEL-I-HD_110x110", label: ""),
                                                cellDataType(image: "RTV-HD_110x110", label: ""),
                                                cellDataType(image: "Ekattor-HD_110x110", label: ""),
                                                cellDataType(image: "Somoy-News_110x110", label: "")]

    private var sectionData4: [cellDataType] = [cellDataType(image: "Independent-TV_110x110", label: ""),
                                                cellDataType(image: "Bijoy-TV_110x110", label: ""),
                                                cellDataType(image: "Channel-24_110x110", label: ""),
                                                cellDataType(image: "NTV_110x110", label: ""),
                                                cellDataType(image: "Desh-TV_110x110", label: "")]
    
    private var sectionData5: [cellDataType] = [cellDataType(image: "Independent-TV_110x110", label: ""),
                                                cellDataType(image: "Bijoy-TV_110x110", label: ""),
                                                cellDataType(image: "Channel-24_110x110", label: ""),
                                                cellDataType(image: "NTV_110x110", label: ""),
                                                cellDataType(image: "Desh-TV_110x110", label: "")]

    
    struct cellDataType {
        let image: String
        let label: String
    }
    
    struct supplementaryDataType {
        let header: String
        let footer: String
    }
    
    enum Section: Int, CaseIterable {
        case first
        case second
        case third
        case forth
        case fifth
        case sixth
    }
    
    static let headerKind = "headerKind"
    static let footerKind = "footerKind"
    
    
    private let collectionView: UICollectionView = {

        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            
//            guard let section = Section(rawValue: sectionNumber) else {return nil}
//
//            switch section {
//
//            case .first:
                
            
            if sectionNumber == 0 {
                    print("first carossel")
                    
                    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                    //                item.contentInsets.trailing = 2
                    //                item.contentInsets.bottom = 8
                    
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(414)), subitems: [item])
                    
                    let section = NSCollectionLayoutSection(group: group)
                    section.orthogonalScrollingBehavior = .groupPaging
                    
                    section.visibleItemsInvalidationHandler = { (items, offset, environment) in
                        items.forEach { item in
                            let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                            let minScale: CGFloat = 0.8
                            let maxScale: CGFloat = 1.0 - (distanceFromCenter / environment.container.contentSize.width)
                            let scale = max(maxScale, minScale)
                            item.transform = CGAffineTransform(scaleX: scale, y: scale)
                        }
                    }
                    return section
                    
                    
                }
            else if sectionNumber == 1 {
                print("third")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalWidth(0.2)))
                item.contentInsets.trailing = 8
                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), subitems: [item])
//                    group.contentInsets.trailing = 8
//                    group.contentInsets.bottom = 32
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 8
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            }
            
                
                else {
                    
                    print("third")
                    
                    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalWidth(0.2)))
                    item.contentInsets.trailing = 8
                    item.contentInsets.bottom = 8
                    
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), subitems: [item])
//                    group.contentInsets.trailing = 8
//                    group.contentInsets.bottom = 32
                    
                    let section = NSCollectionLayoutSection(group: group)
                    //                section.orthogonalScrollingBehavior = .continuous
                    section.contentInsets.leading = 16
                    section.contentInsets.trailing = 8
                    
                    let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
                    let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                    //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                    
                    section.boundarySupplementaryItems = [header] //, footer
                    
                    return section
                }
                
                
//            case .second:
//
//                print("second")
//
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
////                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
//
//                section.boundarySupplementaryItems = [header] //, footer
//
//                return section
//
//
//            case .third:
//
//
//
//            case .forth:
//
//                print("forth")
//
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0)))
//                item.contentInsets.trailing = 16
//                item.contentInsets.bottom = 8
//
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(66)), subitems: [item])
//
//                let section = NSCollectionLayoutSection(group: group)
////                section.orthogonalScrollingBehavior = .continuous
//                section.contentInsets.leading = 16
//
//                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
////                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
//
//                section.boundarySupplementaryItems = [header] //, footer
//
//                return section
//
//
//            case .fifth:
//                print("fifth")
//
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0)))
//                item.contentInsets.trailing = 16
//                item.contentInsets.bottom = 8
//
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(66)), subitems: [item])
//
//                let section = NSCollectionLayoutSection(group: group)
////                section.orthogonalScrollingBehavior = .continuous
//                section.contentInsets.leading = 16
//
//                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
////                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
//
//                section.boundarySupplementaryItems = [header] //, footer
//
//                return section
//
//            case .sixth:
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0)))
//                item.contentInsets.trailing = 16
//                item.contentInsets.bottom = 8
//
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(66)), subitems: [item])
//
//                let section = NSCollectionLayoutSection(group: group)
////                section.orthogonalScrollingBehavior = .continuous
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
        }
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: HomeViewController.headerKind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: HomeViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
                                                                                       
        return collection
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCollectionView()

    }
    
    func loadCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .clear
 
        view.addSubview(collectionView)
        
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(pullDownToRefresh), for: .valueChanged)
    }
    
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
    
    @objc private func pullDownToRefresh() {
        print("Refresh")
        
//        sectionData0 = []
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
    
    @IBAction func actionButtonPressed(_ sender: UIBarButtonItem) {

//        self.tabBarController?.tabBar.isHidden = true
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ActionViewController") as! ActionViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .coverVertical

//
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromLeft
//        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
//        view.window!.layer.add(transition, forKey: kCATransition)

//        self.tabBarController?.modalPresentationCapturesStatusBarAppearance = false
//        self.tabBarController?.tabBar.removeFromSuperview()
//        self.addChild(tabBarController!)
//
        
//        
//        self.tabBarController?.tabBar.isHidden = false
        
        self.present(vc, animated: false, completion: nil)
        
        
        
    }
    
    

}




extension LiveTvViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionHeadersFooters.count
//        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let sections = Section(rawValue: section) else {return 0}
        
        switch sections {
            
        case .first:
            return sectionData0.count
        case .second:
            return sectionData1.count
        case .third:
            return sectionData2.count
        case .forth:
            return sectionData3.count
        case .fifth:
            return sectionData4.count
        case .sixth:
            return sectionData5.count
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        print("supp indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        switch kind {
            case HomeViewController.headerKind:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: sectionHeadersFooters[indexPath.section].header)
                return header
                
                
            case HomeViewController.footerKind:
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                footer.setup(foot: sectionHeadersFooters[indexPath.section].footer, indicatorFlag: false)
                return footer
                
                
            default :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: "Default header")
                return header
        }
    }
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("Cell indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        
        guard let section = Section(rawValue: indexPath.section) else {return UICollectionViewCell()}
        
        switch section {
            
        case .first:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData0[indexPath.item].image, and: sectionData0[indexPath.item].label)
            cell.backgroundColor = .orange
            cell.layer.cornerRadius = 0
            return cell
            
        case .second:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData1[indexPath.item].image, and: sectionData1[indexPath.item].label)
//            cell.backgroundColor = .orange
//            cell.layer.backgroundColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
//            cell.layer.cornerRadius = 5
            return cell
            
        case .third:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData2[indexPath.item].image, and: sectionData2[indexPath.item].label)
//            cell.backgroundColor = .orange
            return cell
            
        case .forth:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData3[indexPath.item].image, and: sectionData3[indexPath.item].label)
//            cell.backgroundColor = .orange
            return cell
            
        case .fifth:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData4[indexPath.item].image, and: sectionData4[indexPath.item].label) //dynamic
//            cell.backgroundColor = .orange
            return cell
            
        case .sixth:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData5[indexPath.item].image, and: sectionData4[indexPath.item].label) //dynamic
//            cell.backgroundColor = .orange
            return cell
        }
        
    }
}


extension LiveTvViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let controller = UIViewController()
//
//        controller.view.backgroundColor = indexPath.item == 0 ? .yellow : indexPath.item == 1 ? .blue : .red
//
//        self.navigationController?.pushViewController(controller, animated: true)
    }
}
