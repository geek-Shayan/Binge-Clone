//
//  CategoryViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 25/6/23.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
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

    private var sectionData0: [CellDataType] = [CellDataType(image: "image 5", label: "1"),
                                                CellDataType(image: "image 5", label: "2"),
                                                CellDataType(image: "image 5", label: "3"),
                                                CellDataType(image: "image 5", label: "4")]
    
    private var sectionData1: [CellDataType] = [CellDataType(image: "s", label: "Sports"),
                                                CellDataType(image: "s", label: "News"),
                                                CellDataType(image: "s", label: "Entertainment"),
                                                CellDataType(image: "s", label: "Local TV"),
                                                CellDataType(image: "s", label: "Movies"),
                                                CellDataType(image: "s", label: "Music"),
                                                CellDataType(image: "s", label: "Kids"),
                                                CellDataType(image: "s", label: "Infotainment"),
                                                CellDataType(image: "s", label: "Religious")]
    
    private var sectionData2: [CellDataType] = [CellDataType(image: "Sony Ten 1 1", label: ""),
                                                CellDataType(image: "Sony Ten 2 1", label: ""),
                                                CellDataType(image: "Sony Ten 3 1", label: ""),
                                                CellDataType(image: "Sony Ten 5 1", label: ""),
                                                CellDataType(image: "Sony Ten 1 1", label: ""),
                                                CellDataType(image: "Sony Ten 2 1", label: ""),
                                                CellDataType(image: "Sony Ten 3 1", label: ""),
                                                CellDataType(image: "Sony Ten 5 1", label: "")]
    
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
    
    
    
    
//    static let headerKind = "headerKind"
//    static let footerKind = "footerKind"
    
    private var selectedItem = [String]()
    private var selectedSectionIndex = Int()
    
    private let collectionView: UICollectionView = {
//        let layout = UICollectionViewLayout()
        let layout = UICollectionViewFlowLayout()
        
//         .collectionViewLayout = UICollectionViewFlowLayout()

//        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
//
//
//            print("first ...")
////
//            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33) , heightDimension: .fractionalWidth(0.33)))
//            item.contentInsets.trailing = 8
//            item.contentInsets.bottom = 8
//
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140)), subitems: [item])
//
//            let section = NSCollectionLayoutSection(group: group)
//            section.contentInsets.leading = 16
//            section.contentInsets.trailing = 8
////                section.contentInsets.bottom = 16
//
//            let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(30))
//            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
//            //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
//            section.boundarySupplementaryItems = [header] //, footer
//
//            return section
//
//        }
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collection.register(UINib(nibName: "CustomCarosselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomCarosselCollectionViewCell.identifier)
//        
//        collection.register(UINib(nibName: "CustomFilterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomFilterCollectionViewCell.identifier)
        
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)

        //        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: CategoryViewController.headerKind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
//        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: CategoryViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
        


                                                                                       
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        categoryCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
//        loadCollectionView()
        
        loadCategoryCollectionView()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        collectionView.frame = view.bounds
        collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
//        collectionView.topAnchor = self.navigationController?.view.bottomAnchor
//        collectionView.topAnchor.constraint(equalTo: (self.navigationController?.view.bottomAnchor)!)
    }

    func loadCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

        
        collectionView.backgroundColor = .clear
        
        //        collectionView.allowsMultipleSelection = true //
        
        view.addSubview(collectionView)
        
//        collectionView.refreshControl = UIRefreshControl()
//        collectionView.refreshControl?.addTarget(self, action: #selector(pullDownToRefresh), for: .valueChanged)
    }
    
    func loadCategoryCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        categoryCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        categoryCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        categoryCollectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
    }
    
    
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 190, height: 300)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 180.0)
//    }
//
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width, height: 30)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width/3 - 18 , height: self.collectionView.frame.size.height/6)
    }
}

extension CategoryViewController: UICollectionViewDelegate {
    
}


extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionData3.count
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        print("supp indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        switch kind {
//            case HomeViewController.headerKind:
        case  UICollectionView.elementKindSectionHeader:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: sectionHeadersFooters[indexPath.section].header)
                return header
                
                
//            case HomeViewController.footerKind:
            case UICollectionView.elementKindSectionFooter:
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        
        cell.setup(image: sectionData3[indexPath.item].image, label: sectionData3[indexPath.item].label)
        return cell
    }
    
    
}
