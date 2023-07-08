//
//  CategoryViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 25/6/23.
//

import UIKit

class CategoryViewController: UIViewController {
    
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
            
            print("first ...")
            
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
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UINib(nibName: "CustomCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomCategoryCollectionViewCell.identifier)
        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: LiveTvViewController.headerKind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: LiveTvViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
                                                                                       
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
    
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt  \(indexPath)")
        if indexPath.section == 0 {
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCategoryCollectionViewCell
            
            //send to new vc
            let vc = UIViewController()
            vc.view.backgroundColor = .orange
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionData3.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        print("supp indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        switch kind {
            case CategoryViewController.headerKind:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: sectionHeadersFooters[indexPath.section].header)
                return header
                
            case CategoryViewController.footerKind:
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCategoryCollectionViewCell.identifier, for: indexPath) as! CustomCategoryCollectionViewCell
        cell.setup(image: sectionData3[indexPath.item].image)
//        cell.backgroundColor = .orange
        return cell
    }
    
    
}
