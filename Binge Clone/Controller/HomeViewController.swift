//
//  HomeViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 23/5/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var actionContainerView: UIView!
    
    @IBOutlet weak var actionTableView: UITableView!
    
    var actionOpen: Bool = true
    
    var titleName = ["Profile", "Edit Profile", "Support", "setting", "Profile", "Edit Profile", "Support", "setting"]
    var imageName = [UIImage(systemName: "person"), UIImage(systemName: "pencil"), UIImage(systemName: "phone"), UIImage(systemName: "gearshape"), UIImage(systemName: "person"), UIImage(systemName: "pencil"), UIImage(systemName: "phone"), UIImage(systemName: "gearshape")]
    
    
    
//    private var sectionHeadersFooters: [SupplementaryDataType] = [SupplementaryDataType(header: "", footer: ""),
//                                                                  SupplementaryDataType(header: "Continue Watch", footer: "C"),
//                                                                  SupplementaryDataType(header: "Exclusive Sports", footer: "E"),
//                                                                  SupplementaryDataType(header: "Recommended For you", footer: "R"),
//                                                                  SupplementaryDataType(header: "Originals (Free: Robi Data, Mob App)", footer: ""),
//                                                                  SupplementaryDataType(header: "Sports", footer: ""),
//                                                                  ]
//
//
//    private var sectionData0: [CellDataType] = [CellDataType(image: "s1", label: "1"),
//                                                CellDataType(image: "s1", label: "2"),
//                                                CellDataType(image: "s1", label: "3"),
//                                                CellDataType(image: "s1", label: "4")]
//
//    private var sectionData1: [CellDataType] = [CellDataType(image: "s2", label: "1"),
//                                                CellDataType(image: "s2", label: "2"),
//                                                CellDataType(image: "s2", label: "3"),
//                                                CellDataType(image: "s2", label: "4"),
//                                                CellDataType(image: "s2", label: "5"),
//                                                CellDataType(image: "s2", label: "6"),
//                                                CellDataType(image: "s2", label: "7"),
//                                                CellDataType(image: "s2", label: "8")]
//
//    private var sectionData2: [CellDataType] = [CellDataType(image: "s3", label: "1"),
//                                                CellDataType(image: "s3", label: "2"),
//                                                CellDataType(image: "s3", label: "3"),
//                                                CellDataType(image: "s3", label: "4")]
//
//    private var sectionData3: [CellDataType] = [CellDataType(image: "s4", label: "1"),
//                                                CellDataType(image: "s4", label: "2"),
//                                                CellDataType(image: "s4", label: "3"),
//                                                CellDataType(image: "s4", label: "4")]
//
//    private var sectionData4: [CellDataType] = [CellDataType(image: "s5", label: "1"),
//                                                CellDataType(image: "s5", label: "2"),
//                                                CellDataType(image: "s5", label: "3"),
//                                                CellDataType(image: "s5", label: "4"),
//                                                CellDataType(image: "s5", label: "5"),
//                                                CellDataType(image: "s5", label: "6"),
//                                                CellDataType(image: "s5", label: "7"),
//                                                CellDataType(image: "s5", label: "8"),
//                                                CellDataType(image: "s5", label: "9"),
//                                                CellDataType(image: "s5", label: "10")]
//
//    private var sectionData5: [CellDataType] = [CellDataType(image: "s6", label: "1"),
//                                                CellDataType(image: "s6", label: "2"),
//                                                CellDataType(image: "s6", label: "3"),
//                                                CellDataType(image: "s6", label: "4")]
//
//
    
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
            
//            case .second:
            else if sectionNumber == 1 {
                
                print("second")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(150)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            }
                
//            case .third:
            else if sectionNumber == 2 {
                
                print("third")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(120), heightDimension: .absolute(120)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            }
                
//            case .forth:
            else if sectionNumber == 3 {
                
                print("forth")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(150)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            }
                
//            case .fifth:
            else if sectionNumber == 4 {
                
                print("fifth")
                
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
                
//            case .sixth:
//            else if sectionNumber == 5 {
            else {
                print("sixth...")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(120), heightDimension: .absolute(120)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            
            }
        }
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: HomeViewController.headerKind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: HomeViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
                                                                                       
        return collection
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.title = "Binge"
        
        loadCollectionView()
        
        loadActionTableview()
        
    }
        
    func loadActionTableview() {
        actionTableView.register(UINib(nibName: "CustomActionTableViewCell", bundle: nil), forCellReuseIdentifier: CustomActionTableViewCell.identifier)
        view.addSubview(actionContainerView)
        
//        actionContainerView.backgroundColor = .gray // blur
//        actionContainerView.backgroundColor = .clear
//        actionTableView.backgroundColor = .orange

        
        actionContainerView.isHidden = true
        
        actionOpen = false
        
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
    
    
    @IBAction func actionButtonPressed(_ sender: UIBarButtonItem) {
        
//        let vc = UIViewController()
//        vc.view.addSubview(UIView())
//        vc.view.backgroundColor = .cyan
//        vc.view.frame = CGRect(x:0 , y: 0, width: view.frame.size.width - 100, height: view.frame.size.height)
//        navigationController?.pushViewController(vc, animated: true)
        
//        actionContainerView.isHidden = !actionContainerView.isHidden
        
//        self.navigationController?.navigationBar.layer.zPosition = -1;
        
//        self.navigationController?.navigationBar.toggle()
//        self.tabBarController?.tabBar.toggle()
        
        actionContainerView.isHidden = false
        actionTableView.isHidden = false
        
//        actionContainerView.isHidden = !actionContainerView.isHidden
//        actionTableView.isHidden = !actionTableView.isHidden
        
        if !actionOpen {
            actionOpen = true
            
            actionContainerView.frame = CGRect(x: -self.actionContainerView.bounds.width, y: self.actionContainerView.frame.origin.y , width: self.actionContainerView.bounds.width, height: self.actionContainerView.bounds.height)
            actionTableView.frame = CGRect(x: -self.actionTableView.bounds.width, y: self.actionTableView.frame.origin.y, width: self.actionTableView.bounds.width, height: self.actionTableView.bounds.height)
            actionContainerView.alpha = 0.0
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
                self.actionContainerView.frame = CGRect(x: 0, y: self.actionContainerView.frame.origin.y, width: self.actionContainerView.bounds.width, height: self.actionContainerView.bounds.height)
                self.actionTableView.frame = CGRect(x: 0, y: self.actionTableView.frame.origin.y, width: self.actionTableView.bounds.width, height: self.actionTableView.bounds.height)
                self.actionContainerView.alpha = 1.0
            })
            
        }
        
        else {
//            actionContainerView.isHidden = true
//            actionTableView.isHidden = true
            actionOpen = false
            
            actionContainerView.frame = CGRect(x: 0, y: self.actionContainerView.frame.origin.y, width: self.actionContainerView.bounds.width, height: self.actionContainerView.bounds.height)
            actionTableView.frame = CGRect(x: 0, y: self.actionTableView.frame.origin.y, width: self.actionTableView.bounds.width, height: self.actionTableView.bounds.height)
            actionContainerView.alpha = 1.0
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.actionContainerView.frame = CGRect(x: -self.actionContainerView.bounds.width, y: self.actionContainerView.frame.origin.y, width: self.actionContainerView.bounds.width, height: self.actionContainerView.bounds.height)
                self.actionTableView.frame = CGRect(x: -self.actionTableView.bounds.width, y: self.actionTableView.frame.origin.y, width: self.actionTableView.bounds.width, height: self.actionTableView.bounds.height)
                self.actionContainerView.alpha = 0.0
            })

        }
        
    }
    
    
    @objc private func pullDownToRefresh() {
        print("Refresh")
        
//        sectionData0 = []
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
    
}


extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return sectionHeadersFooters.count
//        return homeSectionsData.carosselSection0
        return homeSectionsData.sections.count
//        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeSectionsData.sections[section].cells.count
        
//        guard let sections = Section(rawValue: section) else {return 0}
//
//        switch sections {
//
//        case .first:
////            return sectionData0.count
////            return homeSectionsData.carosselSection0.cells.count
//            return homeSectionsData.sections[section].cells.count
//        case .second:
//            return sectionData1.count
//        case .third:
//            return sectionData2.count
//        case .forth:
//            return sectionData3.count
//        case .fifth:
//            return sectionData4.count
//        case .sixth:
//            return sectionData5.count
//
//        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        print("supp indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        switch kind {
            case HomeViewController.headerKind:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
//                header.setup(head: sectionHeadersFooters[indexPath.section].header)//
                header.setup(head: homeSectionsData.sections[indexPath.section].headerFooter.header)
                return header
                
                
            case HomeViewController.footerKind:
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
//                footer.setup(foot: sectionHeadersFooters[indexPath.section].footer, indicatorFlag: false)
            footer.setup(foot: homeSectionsData.sections[indexPath.section].headerFooter.footer, indicatorFlag: false)
                return footer
                
                
            default :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: "Default header")
                return header
        }
    }
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("Cell indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.setup(image: homeSectionsData.sections[indexPath.section].cells[indexPath.item].image, label: homeSectionsData.sections[indexPath.section].cells[indexPath.item].label)
        cell.backgroundColor = .red
        return cell
        
//        guard let section = Section(rawValue: indexPath.section) else {return UICollectionViewCell()}
//
//        switch section {
//
//        case .first:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
////            cell.setup(image: sectionData0[indexPath.item].image, label: sectionData0[indexPath.item].label)
////            cell.setup(image: homeSectionsData.carosselSection0.cells[indexPath.item].image, label: homeSectionsData.carosselSection0.cells[indexPath.item].label)
//            cell.setup(image: homeSectionsData.sections[indexPath.section].cells[indexPath.item].image, label: homeSectionsData.sections[indexPath.section].cells[indexPath.item].label)
//            cell.backgroundColor = .white
//            self.collectionView.layoutIfNeeded()
//            return cell
//
//        case .second:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
////            cell.setup(image: sectionData1[indexPath.item].image, label: sectionData1[indexPath.item].label)
//            cell.setup(image: homeSectionsData.sections[indexPath.section].cells[indexPath.item].image, label: homeSectionsData.sections[indexPath.section].cells[indexPath.item].label)
//            cell.backgroundColor = .white
//            return cell
//
//        case .third:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
////            cell.setup(image: sectionData2[indexPath.item].image, label: sectionData2[indexPath.item].label)
//            cell.setup(image: homeSectionsData.sections[indexPath.section].cells[indexPath.item].image, label: homeSectionsData.sections[indexPath.section].cells[indexPath.item].label)
//            cell.backgroundColor = .white
//            return cell
//
//        case .forth:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
////            cell.setup(image: sectionData3[indexPath.item].image, label: sectionData3[indexPath.item].label)
//            cell.setup(image: homeSectionsData.sections[indexPath.section].cells[indexPath.item].image, label: homeSectionsData.sections[indexPath.section].cells[indexPath.item].label)
//            cell.backgroundColor = .red
//            return cell
//
//        case .fifth:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
////            cell.setup(image: sectionData4[indexPath.item].image, label: sectionData4[indexPath.item].label) //dynamic
//            cell.setup(image: homeSectionsData.sections[indexPath.section].cells[indexPath.item].image, label: homeSectionsData.sections[indexPath.section].cells[indexPath.item].label)
//            cell.backgroundColor = .red
//            return cell
//
//        case .sixth:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
////            cell.setup(image: sectionData5[indexPath.item].image, label: sectionData4[indexPath.item].label) //dynamic
//            cell.setup(image: homeSectionsData.sections[indexPath.section].cells[indexPath.item].image, label: homeSectionsData.sections[indexPath.section].cells[indexPath.item].label)
//            cell.backgroundColor = .red
//            return cell
//        }
        
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


extension HomeViewController: UITableViewDelegate {
    
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomActionTableViewCell.identifier, for: indexPath) as! CustomActionTableViewCell
        cell.actionImage.image = imageName[indexPath.row]
        cell.actionLabel.text = titleName[indexPath.row]
//        cell.backgroundColor = .brown
        return cell
    }
}
