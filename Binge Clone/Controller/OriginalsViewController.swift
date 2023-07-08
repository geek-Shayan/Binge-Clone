//
//  OriginalsViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 25/5/23.
//

import UIKit

class OriginalsViewController: UIViewController {
    
    private var sectionHeadersFooters: [SupplementaryDataType] = [SupplementaryDataType(header: "Sports", footer: ""),
                                                                  SupplementaryDataType(header: "Sports", footer: ""),
                                                                  SupplementaryDataType(header: "Sports", footer: "E"),
                                                                  SupplementaryDataType(header: "News (Free: Robi Data, Mob App)", footer: "R"),
                                                                  SupplementaryDataType(header: "Entertainment", footer: "R"),
                                                                  SupplementaryDataType(header: "Local TV (Free: Robi Data, Mob App)", footer: "R"),
                                                                  SupplementaryDataType(header: "Movies", footer: ""),
                                                                  SupplementaryDataType(header: "Music", footer: ""),
                                                                  SupplementaryDataType(header: "Kids", footer: ""),
                                                                  SupplementaryDataType(header: "Infotainment", footer: ""),
                                                                  SupplementaryDataType(header: "Religious", footer: "")]

    
    private var sectionData3: [CellDataType] = [CellDataType(image: "Independent-TV_110x110", label: ""),
                                                CellDataType(image: "image 20", label: "1"),
                                                CellDataType(image: "image 5",  label: "2"),
                                                CellDataType(image: "image 16", label: "3"),
                                                CellDataType(image: "image 70", label: "4"),
                                                CellDataType(image: "image 19", label: "5"),
                                                CellDataType(image: "image 17", label: "6"),
                                                CellDataType(image: "image 12", label: "7"),
                                                CellDataType(image: "image 11", label: "8"),
                                                CellDataType(image: "image 10", label: "9"),
                                                CellDataType(image: "image 9",  label: "10"),
                                                CellDataType(image: "image 6",  label: "11"),
                                                CellDataType(image: "image 4",  label: "12"),
                                                CellDataType(image: "image 2",  label: "13"),
                                                CellDataType(image: "Bijoy-TV_110x110", label: ""),
                                                CellDataType(image: "Channel-24_110x110", label: ""),
                                                CellDataType(image: "NTV_110x110", label: ""),
                                                CellDataType(image: "Desh-TV_110x110", label: ""),
                                                CellDataType(image: "CHANNEL-I-HD_110x110", label: ""),
                                                CellDataType(image: "RTV-HD_110x110", label: ""),
                                                CellDataType(image: "Ekattor-HD_110x110", label: ""),
                                                CellDataType(image: "Somoy-News_110x110", label: ""),
                                                CellDataType(image: "Independent-TV_110x110", label: ""),
                                                CellDataType(image: "Bijoy-TV_110x110", label: ""),
                                                CellDataType(image: "Channel-24_110x110", label: ""),
                                                CellDataType(image: "NTV_110x110", label: ""),
                                                CellDataType(image: "Desh-TV_110x110", label: ""),
                                                CellDataType(image: "Ekattor-HD_110x110", label: ""),
                                                CellDataType(image: "Somoy-News_110x110", label: ""),
                                                CellDataType(image: "Independent-TV_110x110", label: ""),
                                                CellDataType(image: "Bijoy-TV_110x110", label: ""),
                                                CellDataType(image: "Channel-24_110x110", label: ""),
                                                CellDataType(image: "RTV-HD_110x110", label: ""),
                                                CellDataType(image: "Ekattor-HD_110x110", label: ""),
                                                CellDataType(image: "Somoy-News_110x110", label: ""),
                                                CellDataType(image: "Independent-TV_110x110", label: ""),
                                                CellDataType(image: "Bijoy-TV_110x110", label: ""),
                                                CellDataType(image: "Channel-24_110x110", label: ""),
                                                CellDataType(image: "NTV_110x110", label: ""),
                                                CellDataType(image: "Desh-TV_110x110", label: ""),
                                                CellDataType(image: "CHANNEL-I-HD_110x110", label: ""),
                                                CellDataType(image: "RTV-HD_110x110", label: ""),
                                                CellDataType(image: "Ekattor-HD_110x110", label: ""),
                                                CellDataType(image: "Somoy-News_110x110", label: ""),
                                                CellDataType(image: "Independent-TV_110x110", label: ""),
                                                CellDataType(image: "Bijoy-TV_110x110", label: ""),
                                                CellDataType(image: "Channel-24_110x110", label: ""),
                                                CellDataType(image: "NTV_110x110", label: ""),
                                                CellDataType(image: "Desh-TV_110x110", label: ""),
                                                CellDataType(image: "Ekattor-HD_110x110", label: ""),
                                                CellDataType(image: "Somoy-News_110x110", label: ""),
                                                CellDataType(image: "Independent-TV_110x110", label: ""),
                                                CellDataType(image: "Bijoy-TV_110x110", label: ""),
                                                CellDataType(image: "Channel-24_110x110", label: ""),
                                                CellDataType(image: "RTV-HD_110x110", label: ""),
                                                CellDataType(image: "Ekattor-HD_110x110", label: ""),
                                                CellDataType(image: "Somoy-News_110x110", label: "")]
    
    
    static let headerKind = "headerKind"
    static let footerKind = "footerKind"
    
    private let collectionView: UICollectionView = {

        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            
            if sectionNumber == 0 {
                print("first carossel")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //                item.contentInsets.trailing = 2
                //                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(400)), subitems: [item])
                
                
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
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1) , heightDimension: .fractionalHeight(1)))
//                item.contentInsets.trailing = 8
//                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(42)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 16
                section.contentInsets.bottom = 24
                
                return section
            }
            
            else{
                print("third ...")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33) , heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 8
                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(133)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 4
                section.contentInsets.bottom = 16
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(30))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            }
        }
            
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UINib(nibName: "CustomCarosselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomCarosselCollectionViewCell.identifier)
        collection.register(UINib(nibName: "CustomTitleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomTitleCollectionViewCell.identifier)
        collection.register(UINib(nibName: "CustomCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomCategoryCollectionViewCell.identifier)
        
        
        collection.register(UINib(nibName: "CustomHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: OriginalsViewController.headerKind, withReuseIdentifier: CustomHeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: OriginalsViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
                                                                                       
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
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    @objc private func pullDownToRefresh() {
        print("Refresh")
        
//        selectedItem = []
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
    
    @IBAction func actionButtonPressed(_ sender: UIBarButtonItem) {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true)
    }
    


}


extension OriginalsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt  \(indexPath)")
        if indexPath.section == 0 {
//            let cell = collectionView.cellForItem(at: indexPath) as! CustomCategoryCollectionViewCell
            
            //send to new vc
            let vc = UIViewController()
            vc.view.backgroundColor = .orange
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


extension OriginalsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return originalsSectionsData.sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return originalsSectionsData.sections[section].cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        print("supp indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        
        switch kind {
            case CategoryViewController.headerKind:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeaderCollectionReusableView.headerIdentifier, for: indexPath) as! CustomHeaderCollectionReusableView
                header.setup(head: originalsSectionsData.sections[indexPath.section].headerFooter.header, imageFlag: true)
                return header
                
            case CategoryViewController.footerKind:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                footer.setup(foot: originalsSectionsData.sections[indexPath.section].headerFooter.footer, indicatorFlag: false)
                return footer
                
            default :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: "Default header")
                return header
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCarosselCollectionViewCell.identifier, for: indexPath) as! CustomCarosselCollectionViewCell
            cell.setup(image: originalsSectionsData.sections[indexPath.section].cells[indexPath.item].image)
            //            cell.backgroundColor = .orange
            cell.layer.cornerRadius = 0
            return cell
        }
        
        else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTitleCollectionViewCell.identifier, for: indexPath) as! CustomTitleCollectionViewCell
//            cell.setup(image: originalsSectionsData.sections[indexPath.section].cells[indexPath.item].image)
            cell.setup(title: "VOYER GOLPO", year: "2023", genre: "Thriller", duration: "1h 39m")
            //        cell.backgroundColor = .orange
            return cell  
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCategoryCollectionViewCell.identifier, for: indexPath) as! CustomCategoryCollectionViewCell
            cell.setup(image: originalsSectionsData.sections[indexPath.section].cells[indexPath.item].image)
            //        cell.backgroundColor = .orange
            return cell            
        }
    }
    
    
}
