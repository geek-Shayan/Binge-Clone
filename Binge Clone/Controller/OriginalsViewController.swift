//
//  OriginalsViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 25/5/23.
//

import UIKit

class OriginalsViewController: UIViewController {
    
    static let headerKind = "headerKind"
    static let footerKind = "footerKind"
    
    private var titleData = [String]()
    private var yearData = [String]()
    private var genreData = [String]()
    private var durationData = [String]()

    private let collectionView: UICollectionView = {

        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            
            if sectionNumber == 0 {
                print("first carossel")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //                item.contentInsets.trailing = 2
                //                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(400)), subitems: [item])
                
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets.bottom = 10
                
                section.visibleItemsInvalidationHandler = { (items, scrollOffset, environment) in
                    items.forEach { item in
                        let distanceFromCenter = abs((item.frame.midX - scrollOffset.x) - environment.container.contentSize.width / 2.0)
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
//                group.contentInsets.trailing = 16
                
                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 16
                section.contentInsets.bottom = 24
//                section.interGroupSpacing = 32
                
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
    
    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        
        let searchVC = storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
//        searchVC.view.backgroundColor = .systemTeal
        navigationController?.pushViewController(searchVC, animated: false)
        
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
            case OriginalsViewController.headerKind:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeaderCollectionReusableView.headerIdentifier, for: indexPath) as! CustomHeaderCollectionReusableView
                    header.setup(head: originalsSectionsData.sections[indexPath.section].headerFooter.header, imageFlag: true)
                    return header
                
            case OriginalsViewController.footerKind:
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                    footer.setup(foot: originalsSectionsData.sections[indexPath.section].headerFooter.footer, indicatorFlag: false)
                    return footer
                
            default :
                return UICollectionReusableView()

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCarosselCollectionViewCell.identifier, for: indexPath) as! CustomCarosselCollectionViewCell
            cell.setup(image: originalsSectionsData.sections[indexPath.section].cells[indexPath.item].image, indexPath: indexPath, dataSize: originalsSectionsData.sections[indexPath.section].cells.count)
//            self.titleData.append(originalsSectionsData.sections[indexPath.section].cells[indexPath.item].title ?? "Title")
//            self.yearData.append(originalsSectionsData.sections[indexPath.section].cells[indexPath.item].year ?? "Year")
//            self.genreData.append(originalsSectionsData.sections[indexPath.section].cells[indexPath.item].genre ?? "Genre")
//            self.durationData.append(originalsSectionsData.sections[indexPath.section].cells[indexPath.item].duration ?? "Duration")
            //            cell.backgroundColor = .orange
            cell.layer.cornerRadius = 0
            return cell
            
//            var celln = collectionView.cellForItem(at: indexPath) as! CustomCarosselCollectionViewCell
//            var celln = collectionView.indexPath(for: CustomTitleCollectionViewCell.self)
//            self.titleData = originalsSectionsData.sections[indexPath.section].cells[indexPath.item].title ?? "Title"
//            self.yearData = originalsSectionsData.sections[indexPath.section].cells[indexPath.item].year ?? "Year"
//            self.genreData = originalsSectionsData.sections[indexPath.section].cells[indexPath.item].genre ?? "Genre"
//            self.durationData = originalsSectionsData.sections[indexPath.section].cells[indexPath.item].duration ?? "Duration"
//            celln.setup(image: <#T##String#>, indexPath: <#T##IndexPath#>, dataSize: <#T##Int#>)
//            self.titleData =
//            self.yearData = originalsSectionsData.sections[indexPath.section].cells[indexPath.item].year ?? "Year"
//            self.genreData = originalsSectionsData.sections[indexPath.section].cells[indexPath.item].genre ?? "Genre"
//            self.durationData = originalsSectionsData.sections[indexPath.section].cells[indexPath.item].duration ?? "Duration"
        }
        
        else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTitleCollectionViewCell.identifier, for: indexPath) as! CustomTitleCollectionViewCell
            cell.setup(
                title: originalsSectionsData.sections[indexPath.section].cells[indexPath.item].title ?? "Title",
                year: originalsSectionsData.sections[indexPath.section].cells[indexPath.item].year ?? "Year",
                genre: originalsSectionsData.sections[indexPath.section].cells[indexPath.item].genre ?? "Genre",
                duration: originalsSectionsData.sections[indexPath.section].cells[indexPath.item].duration ?? "Duration"
            )
//            cell.setup(title: titleData, year: yearData, genre: genreData, duration: durationData)
//            cell.setup(title: titleData[indexPath.item], year: yearData[indexPath.item], genre: genreData[indexPath.item], duration: durationData[indexPath.item])
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
