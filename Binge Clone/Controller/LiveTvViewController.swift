//
//  LiveTvViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 25/5/23.
//

import UIKit

class LiveTvViewController: UIViewController {
    
    @IBOutlet weak var topStackView: UIStackView!
    private var sectionHeadersFooters: [supplementaryDataType] = [supplementaryDataType(header: "", footer: ""),
                                                                  supplementaryDataType(header: "", footer: ""),
                                                                  supplementaryDataType(header: "Sports", footer: "E"),
                                                                  supplementaryDataType(header: "News (Free: Robi Data, Mob App)", footer: "R"),
                                                                  supplementaryDataType(header: "Entertainment", footer: "R"),
                                                                  supplementaryDataType(header: "Local TV (Free: Robi Data, Mob App)", footer: "R"),
                                                                  supplementaryDataType(header: "Movies", footer: ""),
                                                                  supplementaryDataType(header: "Music", footer: ""),
                                                                  supplementaryDataType(header: "Kids", footer: ""),
                                                                  supplementaryDataType(header: "Infotainment", footer: ""),
                                                                  supplementaryDataType(header: "Religious", footer: "")]

    private var sectionData0: [cellDataType] = [cellDataType(image: "image 5", label: "1"),
                                                cellDataType(image: "image 5", label: "2"),
                                                cellDataType(image: "image 5", label: "3"),
                                                cellDataType(image: "image 5", label: "4")]
    
    private var sectionData1: [cellDataType] = [cellDataType(image: "s", label: "Sports"),
                                                cellDataType(image: "s", label: "News"),
                                                cellDataType(image: "s", label: "Entertainment"),
                                                cellDataType(image: "s", label: "Local TV"),
                                                cellDataType(image: "s", label: "Movies"),
                                                cellDataType(image: "s", label: "Music"),
                                                cellDataType(image: "s", label: "Kids"),
                                                cellDataType(image: "s", label: "Infotainment"),
                                                cellDataType(image: "s", label: "Religious")]

    private var sectionData2: [cellDataType] = [cellDataType(image: "Sony Ten 1 1", label: ""),
                                                cellDataType(image: "Sony Ten 2 1", label: ""),
                                                cellDataType(image: "Sony Ten 3 1", label: ""),
                                                cellDataType(image: "Sony Ten 5 1", label: ""),
                                                cellDataType(image: "Sony Ten 1 1", label: ""),
                                                cellDataType(image: "Sony Ten 2 1", label: ""),
                                                cellDataType(image: "Sony Ten 3 1", label: ""),
                                                cellDataType(image: "Sony Ten 5 1", label: "")]
    
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


    
    struct cellDataType {
        let image: String
        let label: String
    }
    
    struct supplementaryDataType {
        let header: String
        let footer: String
    }
    
    static let headerKind = "headerKind"
    static let footerKind = "footerKind"
    
    private var selectedItem = [String]()
    
    private let collectionView: UICollectionView = {

        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            
            if sectionNumber == 0 {
                print("first carossel")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//                item.contentInsets.trailing = 2
//                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(403)), subitems: [item])

                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets.bottom = 10
                
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
                print("second")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .fractionalHeight(1)))
                item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: nil, trailing: .fixed(8), bottom: nil)
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(1000), heightDimension: .absolute(28)), subitems: [item])
//                group.interItemSpacing = .fixed(8)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 8
                section.contentInsets.bottom = 16
                
                return section

            }
            
            else {
                print("third ...")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2) , heightDimension: .fractionalWidth(0.2)))
                item.contentInsets.trailing = 8
                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 8
                section.contentInsets.bottom = 16
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(30))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            }

        }
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        collection.register(UINib(nibName: "CustomFilterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomFilterCollectionViewCell.identifier)
        
        collection.register(UINib(nibName: "CustomCarosselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomCarosselCollectionViewCell.identifier)
        
        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: HomeViewController.headerKind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: HomeViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
                                                                                       
        return collection
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCollectionView()

        view.addSubview(topStackView)
        
    }
    
    func loadCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .clear
        
//        collectionView.allowsMultipleSelection = true //
 
        view.addSubview(collectionView)
        
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(pullDownToRefresh), for: .valueChanged)
    }
    
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
    
    @objc private func pullDownToRefresh() {
        print("Refresh")
        
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

//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromLeft
//        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
//        view.window!.layer.add(transition, forKey: kCATransition)

//        self.tabBarController?.modalPresentationCapturesStatusBarAppearance = false
//        self.tabBarController?.tabBar.removeFromSuperview()
//        self.addChild(tabBarController!)

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
        
        if section == 0 {
            return sectionData0.count
        }
        else if section == 1 {
            return sectionData1.count
        }
        else if section == 2 {
            return sectionData2.count
        }
        else {
            return sectionData3.count
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
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCarosselCollectionViewCell.identifier, for: indexPath) as! CustomCarosselCollectionViewCell
//            cell.setup(with: sectionData0[indexPath.item].image, and: sectionData0[indexPath.item].label)
            cell.setup(sectionData0[indexPath.item].image)
            //            cell.backgroundColor = .orange
            cell.layer.cornerRadius = 0
            return cell
        }
        
        else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomFilterCollectionViewCell.identifier, for: indexPath) as! CustomFilterCollectionViewCell
            //            cell.setup(with: sectionData1[indexPath.item].image, and: sectionData1[indexPath.item].label)
            //            cell.backgroundColor = .orange
            
            
//            if cell.isSelected == true || indexPath.item == selectedItem {
            if cell.isSelected == true || selectedItem.contains(where: { $0 == sectionData1[indexPath.item].label}) {
//            if cell.isSelected == true {

                cell.setup(with: sectionData1[indexPath.item].label)
                cell.selected()
                return cell
            }
            else {
                cell.setup(with: sectionData1[indexPath.item].label)
                cell.deSelected()
                return cell
            }
        }
        
        else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData2[indexPath.item].image, and: sectionData2[indexPath.item].label)
            //            cell.backgroundColor = .orange
            return cell
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData3[indexPath.item].image, and: sectionData3[indexPath.item].label)
            //            cell.backgroundColor = .orange
            return cell
        }
    }
}


extension LiveTvViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt")
        if indexPath.section == 1 {
            let cell = collectionView.cellForItem(at: indexPath) as! CustomFilterCollectionViewCell
            
            if cell.isSelected == true && indexPath.section == 1 {
                if selectedItem.contains(where: { $0 == sectionData1[indexPath.item].label}) {
//                if selectedItem.count == 1 { /////
                    cell.deSelected()
                    cell.isSelected = false
                    selectedItem.removeAll { $0 == sectionData1[indexPath.item].label}
                    print("selectedItem    \(selectedItem)")
                }
                else {
                    cell.selected()
                    cell.isSelected = true
                    selectedItem.append(sectionData1[indexPath.item].label)
                    print("selectedItem    \(selectedItem)")
                }
                
//                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition.left)
//                collectionView.reloadSections([indexPath.section])
//                collectionView.reloadItems(at: [indexPath])//
                collectionView.reloadData()
//                cell.layoutIfNeeded()
//                self.view.layoutSubviews()
                
//                print(collectionView.indexPathsForSelectedItems)
                
            }
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("didDeselectItemAt")
        if indexPath.section == 1 {
            let cell = collectionView.cellForItem(at: indexPath) as! CustomFilterCollectionViewCell
            // deselection,
            if cell.isSelected == false && indexPath.section == 1 {
                cell.deSelected()
//                selectedItem.removeAll { $0 == sectionData1[indexPath.item].label}
//                print("selectedItem    \(selectedItem)")
                
//                collectionView.deselectItem(at: indexPath, animated: true)
//                collectionView.reloadSections([indexPath.section])
//                collectionView.reloadItems(at: [indexPath])//
//                collectionView.reloadData()
//                cell.layoutIfNeeded()
//                self.view.layoutSubviews()
              
            }
        }
    }

}
