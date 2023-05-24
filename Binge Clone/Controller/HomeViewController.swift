//
//  HomeViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 23/5/23.
//

import UIKit

class HomeViewController: UIViewController {

    private var isLoading = false
    private var isLastPage = false //
    
    private let itemsPerPage = 5 // loads 10 data per page cycle
    private var currentPage = 0
    
    private var sectionHeadersFooters: [supplementaryDataType] = [supplementaryDataType(header: "", footer: ""),
                                                                  supplementaryDataType(header: "Continue Watch", footer: "C"),
                                                                  supplementaryDataType(header: "Exclusive Sports", footer: "E"),
                                                                  supplementaryDataType(header: "Recommended For you", footer: "R"),
                                                                  supplementaryDataType(header: "Originals (Free: Robi Data, Mob App)", footer: ""),
                                                                  ]


    private var sectionData0: [cellDataType] = [cellDataType(image: "s1", label: "1"),
                                                cellDataType(image: "s1", label: "2"),
                                                cellDataType(image: "s1", label: "3"),
                                                cellDataType(image: "s1", label: "4")]

    private var sectionData1: [cellDataType] = [cellDataType(image: "s2", label: "1"),
                                                cellDataType(image: "s2", label: "2"),
                                                cellDataType(image: "s2", label: "3"),
                                                cellDataType(image: "s2", label: "4"),
                                                cellDataType(image: "s2", label: "5"),
                                                cellDataType(image: "s2", label: "6"),
                                                cellDataType(image: "s2", label: "7"),
                                                cellDataType(image: "s2", label: "8")]

    private var sectionData2: [cellDataType] = [cellDataType(image: "s3", label: "1"),
                                                cellDataType(image: "s3", label: "2"),
                                                cellDataType(image: "s3", label: "3"),
                                                cellDataType(image: "s3", label: "4")]

    private var sectionData3: [cellDataType] = [cellDataType(image: "s4", label: "1"),
                                                cellDataType(image: "s4", label: "2"),
                                                cellDataType(image: "s4", label: "3"),
                                                cellDataType(image: "s4", label: "4")]

    private var sectionData4: [cellDataType] = [cellDataType(image: "s5", label: "1"),
                                                cellDataType(image: "s5", label: "2"),
                                                cellDataType(image: "s5", label: "3"),
                                                cellDataType(image: "s5", label: "4"),
                                                cellDataType(image: "s5", label: "5"),
                                                cellDataType(image: "s5", label: "6"),
                                                cellDataType(image: "s5", label: "7"),
                                                cellDataType(image: "s5", label: "8"),
                                                cellDataType(image: "s5", label: "9"),
                                                cellDataType(image: "s5", label: "10")]

    
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
    
    private let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
        

        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            
            if (sectionNumber == 0) {
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
//                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(480)), subitems: [item])
                
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
        
//            else if (sectionNumber == 1) {
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
//}


            else if (sectionNumber == 1) {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 8
                                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(150)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16

                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                
                section.boundarySupplementaryItems = [header] //, footer
                
                return section


            }
            
            else if (sectionNumber == 2) {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 8
                                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(120), heightDimension: .absolute(120)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16

                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                
                section.boundarySupplementaryItems = [header] //, footer
                
                return section


            }
            
//            else if (sectionNumber == 3) {
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
            
            else if (sectionNumber == 3) {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 8

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.66), heightDimension: .absolute(140)), subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets.leading = 16

                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
//                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)

                section.boundarySupplementaryItems = [header] //, footer

                return section
            }
            
//            else if (sectionNumber == 3) {
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200)))
//                item.contentInsets.trailing = 16
//                item.contentInsets.bottom = 16
//
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
//
//                let section = NSCollectionLayoutSection(group: group)
////                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
//                section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
//
////                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(50))
////                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .top)
////                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottom)
////
////                section.boundarySupplementaryItems = [header, footer]
//
//                return section
//            }
            
            else {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 16, bottom: -8, trailing: 0)
            
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topTrailing)
                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomTrailing)
                
                section.boundarySupplementaryItems = [header, footer]
                
                return section
            }
        }
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: HomeViewController.cellIdentifier)
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
//        collection.register(UICollectionReusableView.self, forSupplementaryViewOfKind: HomeViewController.headerKind, withReuseIdentifier: HomeViewController.headerIdentifier)
        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: HomeViewController.headerKind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: HomeViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
                                                                                       
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

extension HomeViewController: UIScrollViewDelegate {
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


extension HomeViewController: UICollectionViewDataSource {
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
            case HomeViewController.headerKind:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: sectionHeadersFooters[indexPath.section].header)
//                print(indexPath.section)
                return header
                
                
            case HomeViewController.footerKind:
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
                
                
            default :
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: "Default header")
                return header
        }
    }
        
    
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeViewController.cellIdentifier, for: indexPath)
//            cell.backgroundColor = .orange
            cell.backgroundColor = .orange
            return cell
        }
    }
}


extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let controller = UIViewController()
//        
//        controller.view.backgroundColor = indexPath.item == 0 ? .yellow : indexPath.item == 1 ? .blue : .red
//        
//        self.navigationController?.pushViewController(controller, animated: true)
    }
}





