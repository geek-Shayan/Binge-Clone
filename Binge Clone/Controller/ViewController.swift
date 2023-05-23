//
//  ViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 23/5/23.
//

import UIKit

class ViewController: UIViewController {

    private var isLoading = false
    private var isLastPage = false //
    
    private let itemsPerPage = 10 // loads 10 data per page cycle
    private var currentPage = 0
    
    private var sectionHeadersFooters: [supplementaryDataType] = [supplementaryDataType(header: "", footer: ""),
                                                                  supplementaryDataType(header: "Continue Watch", footer: "C"),
                                                                  supplementaryDataType(header: "Recommended For you", footer: "R"),
                                                                  supplementaryDataType(header: "", footer: ""),
                                                                  supplementaryDataType(header: "Card header", footer: "")]


    private var sectionData0: [cellDataType] = [cellDataType(image: "photo 1 s1", label: "Food"),
                                                cellDataType(image: "photo 4 s1", label: "Fresh"),
                                                cellDataType(image: "photo 2 s1", label: "Food"),
                                                cellDataType(image: "photo 4 s1", label: "Fresh")]

    private var sectionData1: [cellDataType] = [cellDataType(image: "burger 1 s2", label: "Burger 1"),
                                                cellDataType(image: "burger 2 s2", label: "Burger 2"),
                                                cellDataType(image: "burger 1 s2", label: "Burger 3"),
                                                cellDataType(image: "burger 2 s2", label: "Burger 4"),
                                                cellDataType(image: "burger 1 s2", label: "Burger 5"),
                                                cellDataType(image: "burger 2 s2", label: "Burger 6"),
                                                cellDataType(image: "burger 1 s2", label: "Burger 7"),
                                                cellDataType(image: "burger 2 s2", label: "Burger 8")]

    private var sectionData2: [cellDataType] = [cellDataType(image: "pasta 1 s3", label: "Pasta 1"),
                                                cellDataType(image: "spaghetti s3", label: "Spaghetti 2"),
                                                cellDataType(image: "pasta 2 s3", label: "Pasta 3"),
                                                cellDataType(image: "friedRice s3", label: "Fried Rice 4")]

    private var sectionData3: [cellDataType] = [cellDataType(image: "pizza s4", label: "Pizza 1"),
                                                cellDataType(image: "spaghetti s3", label: "Spaghetti 2"),
                                                cellDataType(image: "pasta 2 s3", label: "Pasta 3"),
                                                cellDataType(image: "friedRice s3", label: "Fried Rice 4")]

    private var sectionData4: [cellDataType] = [cellDataType(image: "swarma s5", label: "Swarma 1"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 2"),
                                                cellDataType(image: "kabab s5", label: "Kabab 3"),
                                                cellDataType(image: "swarma s5", label: "Swarma 4"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 5"),
                                                cellDataType(image: "kabab s5", label: "Kabab 6"),
                                                cellDataType(image: "swarma s5", label: "Swarma 7"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 8"),
                                                cellDataType(image: "kabab s5", label: "Kabab 9"),
                                                cellDataType(image: "swarma s5", label: "Swarma 10"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 11"),
                                                cellDataType(image: "kabab s5", label: "Kabab 12"),
                                                cellDataType(image: "swarma s5", label: "Swarma 13"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 14"),
                                                cellDataType(image: "kabab s5", label: "Kabab 15"),
                                                cellDataType(image: "swarma s5", label: "Swarma 16"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 17"),
                                                cellDataType(image: "kabab s5", label: "Kabab 18"),
                                                cellDataType(image: "swarma s5", label: "Swarma 19"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 20"),
                                                cellDataType(image: "kabab s5", label: "Kabab 21"),
                                                cellDataType(image: "swarma s5", label: "Swarma 22"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 23"),
                                                cellDataType(image: "kabab s5", label: "Kabab 24"),
                                                cellDataType(image: "swarma s5", label: "Swarma 25"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 26"),
                                                cellDataType(image: "kabab s5", label: "Kabab 27"),
                                                cellDataType(image: "swarma s5", label: "Swarma 28"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 29"),
                                                cellDataType(image: "kabab s5", label: "Kabab 30"),
                                                cellDataType(image: "swarma s5", label: "Swarma 31"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 32"),
                                                cellDataType(image: "kabab s5", label: "Kabab 33"),
                                                cellDataType(image: "swarma s5", label: "Swarma 34"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 35"),
                                                cellDataType(image: "kabab s5", label: "Kabab 36"),
                                                cellDataType(image: "swarma s5", label: "Swarma 37"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 38"),
                                                cellDataType(image: "kabab s5", label: "Kabab 39"),
                                                cellDataType(image: "swarma s5", label: "Swarma 40"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 41"),
                                                cellDataType(image: "kabab s5", label: "Kabab 42"),
                                                cellDataType(image: "swarma s5", label: "Swarma 43"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 44"),
                                                cellDataType(image: "kabab s5", label: "Kabab 45"),
                                                cellDataType(image: "swarma s5", label: "Swarma 46"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 47"),
                                                cellDataType(image: "kabab s5", label: "Kabab 48"),
                                                cellDataType(image: "swarma s5", label: "Swarma 49"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 50"),
                                                cellDataType(image: "kabab s5", label: "Kabab 51"),
                                                cellDataType(image: "swarma s5", label: "Swarma 52"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 53"),
                                                cellDataType(image: "kabab s5", label: "Kabab 54"),
                                                cellDataType(image: "swarma s5", label: "Swarma 55"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 56"),
                                                cellDataType(image: "kabab s5", label: "Kabab 57"),
                                                cellDataType(image: "swarma s5", label: "Swarma 58"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 59"),
                                                cellDataType(image: "kabab s5", label: "Kabab 60"),
                                                cellDataType(image: "swarma s5", label: "Swarma 61"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 62"),
                                                cellDataType(image: "kabab s5", label: "Kabab 63"),
                                                cellDataType(image: "swarma s5", label: "Swarma 64"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 65"),
                                                cellDataType(image: "kabab s5", label: "Kabab 66"),
                                                cellDataType(image: "swarma s5", label: "Swarma 67"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 68"),
                                                cellDataType(image: "kabab s5", label: "Kabab 69"),
                                                cellDataType(image: "swarma s5", label: "Swarma 70"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 71"),
                                                cellDataType(image: "kabab s5", label: "Kabab 72"),
                                                cellDataType(image: "swarma s5", label: "Swarma 73"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 74"),
                                                cellDataType(image: "kabab s5", label: "Kabab 75"),
                                                cellDataType(image: "swarma s5", label: "Swarma 76"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 77"),
                                                cellDataType(image: "kabab s5", label: "Kabab 78"),
                                                cellDataType(image: "swarma s5", label: "Swarma 79"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 80"),
                                                cellDataType(image: "kabab s5", label: "Kabab 81"),
                                                cellDataType(image: "swarma s5", label: "Swarma 82"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 83"),
                                                cellDataType(image: "kabab s5", label: "Kabab 84"),
                                                cellDataType(image: "swarma s5", label: "Swarma 85"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 86"),
                                                cellDataType(image: "kabab s5", label: "Kabab 87"),
                                                cellDataType(image: "swarma s5", label: "Swarma 88"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 89"),
                                                cellDataType(image: "kabab s5", label: "Kabab 90"),
                                                cellDataType(image: "swarma s5", label: "Swarma 91"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 92"),
                                                cellDataType(image: "kabab s5", label: "Kabab 93"),
                                                cellDataType(image: "swarma s5", label: "Swarma 94"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 95"),
                                                cellDataType(image: "kabab s5", label: "Kabab 96"),
                                                cellDataType(image: "swarma s5", label: "Swarma 97"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 98"),
                                                cellDataType(image: "kabab s5", label: "Kabab 99"),
                                                cellDataType(image: "swarma s5", label: "Swarma 100"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 101"),
                                                cellDataType(image: "kabab s5", label: "Kabab 102"),
                                                cellDataType(image: "swarma s5", label: "Swarma 103"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 104"),
                                                cellDataType(image: "kabab s5", label: "Kabab 105"),
                                                cellDataType(image: "swarma s5", label: "Swarma 106"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 107"),
                                                cellDataType(image: "kabab s5", label: "Kabab 108"),
                                                cellDataType(image: "swarma s5", label: "Swarma 109"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 110"),
                                                cellDataType(image: "kabab s5", label: "Kabab 111"),
                                                cellDataType(image: "swarma s5", label: "Swarma 112"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 113"),
                                                cellDataType(image: "kabab s5", label: "Kabab 114"),
                                                cellDataType(image: "swarma s5", label: "Swarma 115"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 116"),
                                                cellDataType(image: "kabab s5", label: "Kabab 117"),
                                                cellDataType(image: "swarma s5", label: "Swarma 118"),
                                                cellDataType(image: "chickenFries s5", label: "Chicken Fry 119"),
                                                cellDataType(image: "kabab s5", label: "Kabab 120")]

    
    var celldata: [cellDataType] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    struct cellDataType {
        let image: String
        let label: String
    }
    
    
    struct supplementaryDataType {
        let header: String
        let footer: String
    }
    
    
    static let cellIdentifier = "cell"
    static let headerKind = "headerKind"
    static let footerKind = "footerKind"
//    static let headerIdentifier = "header"
    
    private let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
        

        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            
            if (sectionNumber == 0) {
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
//                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(500)), subitems: [item])
                //            (layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
            }
        
            else if (sectionNumber == 1) {
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
//                item.contentInsets.trailing = 16
//                item.contentInsets.bottom = 16
//
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
////                group.contentInsets.leading = 16
//
//                let section = NSCollectionLayoutSection(group: group)
//                section.contentInsets.leading = 16
//
//                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(50))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
////                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottom)
//
//                section.boundarySupplementaryItems = [header] //, footer
//
//                return section



                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(150)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16

                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                
                section.boundarySupplementaryItems = [header, footer] //, footer
                
                return section


            }
            
            else if (sectionNumber == 2) {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 32
                                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.80), heightDimension: .absolute(120)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16

                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
//                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            }
            
            else if (sectionNumber == 3) {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
                
//                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(50))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .top)
//                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottom)
//
//                section.boundarySupplementaryItems = [header, footer]
                
                return section
            }
            
            else {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 16, bottom: -8, trailing: 0)
            
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topTrailing)
                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomTrailing)
                
                section.boundarySupplementaryItems = [header, footer]
                
                return section
            }
        }
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ViewController.cellIdentifier)
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
//        collection.register(UICollectionReusableView.self, forSupplementaryViewOfKind: ViewController.headerKind, withReuseIdentifier: ViewController.headerIdentifier)
        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: ViewController.headerKind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: ViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
                                                                                       
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .clear
//        collectionView.backgroundColor = .darkGray
//        navigationItem.title = "FOOD DELIVERY"
 
        view.addSubview(collectionView)
        
        loadData(page: currentPage)
    }
    
    private func loadData(page: Int) {
        isLoading = true

        if sectionData4.isEmpty {
//            fatalError("Null data error!")
            print("Null data error!")
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                self?.isLoading = false
                self?.currentPage += 1
                let newData = (page * (self?.itemsPerPage)!)..<((page + 1) * (self?.itemsPerPage)!)
                print("newData", newData)
                
                self?.celldata.append(contentsOf: newData.map{ (self?.sectionData4[$0])! })
                self?.isLastPage = newData.upperBound >= (self?.sectionData4.count)! // Assumes 100 total items //sectionData4.count
                
//                self?.collectionView.reloadSections(IndexSet(integer: 4))
//                self?.collectionView.reloadData()
            }
        }
//        collectionView.reloadSections(IndexSet(integer: 4))
        collectionView.reloadData()
        
        print("celldata", celldata)
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            checkForLoadMoreData()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        checkForLoadMoreData()
    }
    
    private func checkForLoadMoreData() {
        guard !isLoading && !isLastPage else { return }
        
        let offsetY = collectionView.contentOffset.y
        let contentHeight = collectionView.contentSize.height
        let height = collectionView.frame.size.height

        print(offsetY, contentHeight, height)
        if offsetY > contentHeight - height {
            loadData(page: currentPage)
        }
    }
}


extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionHeadersFooters.count
//        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return sectionData0.count
//            return 3
        }
        else if section == 1 {
            return sectionData1.count
//            return 8
        }
        else if section == 2 {
            return sectionData2.count
//            return 6
        }
        else if section == 3 {
            return sectionData3.count
//            return 4
        }
        else {
            return celldata.count
//            return sectionData4.count
//            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        print("supp indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        switch kind {
            case ViewController.headerKind:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: sectionHeadersFooters[indexPath.section].header)
//                print(indexPath.section)
                return header
                
//                if indexPath.section == 1 {
//                    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
//                    header.setup(head: "Categories header")
//                    return header
//                }
//
//                if indexPath.section == 2 {
//                    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
//                    header.setup(head: "Latest header")
//                    return header
//                }
//
//                if indexPath.section == 4 {
//                    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
//                    header.setup(head: "Card header")
//                    return header
//                }
//
//                else {
//                    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
//                    header.setup(head: "Header")
//                    return header
//                }
                
            case ViewController.footerKind:
                if indexPath.section == 4 {
                    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                    footer.setup(foot: sectionHeadersFooters[indexPath.section].footer, indicatorFlag: isLoading) // isLoading
                    return footer
                }
                else {
                    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                    footer.setup(foot: sectionHeadersFooters[indexPath.section].footer, indicatorFlag: false)
                    return footer
                }
                
                
//                if indexPath.section == 1 {
//                    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
//                    footer.setup(foot: "Categories footer", indicatorFlag: false)
//                    return footer
//                }
//
//                if indexPath.section == 2 {
//                    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
//                    footer.setup(foot: "Latest footer", indicatorFlag: false)
//                    return footer
//                }
////
//                if indexPath.section == 4 {
//                    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
//                    footer.setup(foot: "", indicatorFlag: isLoading) //Card footer
//                    return footer
//                }
//
//                else {
//                    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
//                    footer.setup(foot: "Footer", indicatorFlag: false)
//                    return footer
//                }
                
            default :
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: "Default header")
                return header
        }
    }
        
        
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets(top: 10, left: 100, bottom: 10, right: 10)
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("Cell indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData0[indexPath.item].image, and: sectionData0[indexPath.item].label)
            cell.backgroundColor = .orange
            return cell
        }
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData1[indexPath.item].image, and: sectionData1[indexPath.item].label)
            cell.backgroundColor = .orange
            return cell
        }
        
        if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData2[indexPath.item].image, and: sectionData2[indexPath.item].label)
            cell.backgroundColor = .orange
            return cell
        }
        
        if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData3[indexPath.item].image, and: sectionData3[indexPath.item].label)
            cell.backgroundColor = .orange
            return cell
        }
        
        if indexPath.section == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: celldata[indexPath.item].image, and: celldata[indexPath.item].label) //dynamic
            cell.backgroundColor = .orange
            return cell
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.cellIdentifier, for: indexPath)
//            cell.backgroundColor = .orange
            cell.backgroundColor = .orange
            return cell
        }
        

//        if indexPath.section == 0 && indexPath.item == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
//            cell.setup(with: "photo 1 s1", and: "Food")
//            return cell
//        }
//        if indexPath.section == 0 && indexPath.item == 1 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
//            cell.setup(with: "photo 2 s1", and: "Fruit")
//            return cell
//        }
//        if indexPath.section == 0 && indexPath.item == 2 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
//            cell.setup(with: "photo 1 s1", and: "Fresh")
//            return cell
//        }
//        if indexPath.section == 1 && indexPath.item == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
//            cell.setup(with: "burger 1 s2", and: "Burger")
//            return cell
//        }
//        if indexPath.section == 1 && indexPath.item == 1 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
//            cell.setup(with: "burger 2 s2", and: "Burger")
//            return cell
//        }
        
    }
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIViewController()
        
        controller.view.backgroundColor = indexPath.item == 0 ? .yellow : indexPath.item == 1 ? .blue : .red
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}





