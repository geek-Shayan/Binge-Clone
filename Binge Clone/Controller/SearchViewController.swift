//
//  SearchViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 10/7/23.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var navView: UIStackView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var navLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchIconButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var speechButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    static let headerKind = "headerKind"
    static let footerKind = "footerKind"

    private var searched = false  // T/F T- resltFound check, F- load top searches
    private var resultFound = false  // T/F T- load results, F- load not found + recommended

    private var filteredData = [String]()
    private var carData = ["BMW", "audi", "TOYOTA", "Benz"]
    
    private var searchedItem = String()
    
    
    
    private let collectionViewWithSingleSection: UICollectionView = {
        
        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            
            print("Top searches/ Results")
            
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1) , heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 8
            item.contentInsets.bottom = 15
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(96)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.leading = 16
            section.contentInsets.trailing = 8
//            section.contentInsets.bottom = 16
            
            let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(60))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
//            let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
            section.boundarySupplementaryItems = [header] //, footer
            
            return section
        }
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UINib(nibName: "CustomListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomListCollectionViewCell.identifier)
        
        collection.register(UINib(nibName: "CustomHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: SearchViewController.headerKind, withReuseIdentifier: CustomHeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: SearchViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
        
        return collection
    }()
    
    
    private let collectionViewWithMultipleSection: UICollectionView = {
        
        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            
            if sectionNumber == 0 {
                print("Results")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1) , heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 8
                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.28)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 8
                section.contentInsets.bottom = 16
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(60))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
//                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            }
            
            else {
                print("Recommended Shows")
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1) , heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 8
                item.contentInsets.bottom = 15
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(96)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 8
//                section.contentInsets.bottom = 16
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(60))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
//                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            }
        }
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UINib(nibName: "CustomNoResultCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomNoResultCollectionViewCell.identifier)
        collection.register(UINib(nibName: "CustomListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomListCollectionViewCell.identifier)
        
        collection.register(UINib(nibName: "CustomHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: SearchViewController.headerKind, withReuseIdentifier: CustomHeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: SearchViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        loadSearchBar()
        
        loadCollectionViewWithSingleSection()
        
//        loadCollectionViewWithMultipleSection()
        
    }
    
    private func loadCollectionViewWithSingleSection() {
        collectionViewWithSingleSection.delegate = self
        collectionViewWithSingleSection.dataSource = self
        
        collectionViewWithSingleSection.backgroundColor = .clear
        
        containerView.addSubview(collectionViewWithSingleSection)
        
        collectionViewWithSingleSection.refreshControl = UIRefreshControl()
        collectionViewWithSingleSection.refreshControl?.addTarget(self, action: #selector(pullDownToRefresh), for: .valueChanged)
    }
    
    private func loadCollectionViewWithMultipleSection() {
        collectionViewWithMultipleSection.delegate = self
        collectionViewWithMultipleSection.dataSource = self
        
        collectionViewWithMultipleSection.backgroundColor = .clear
        
        containerView.addSubview(collectionViewWithMultipleSection)
        
        collectionViewWithMultipleSection.refreshControl = UIRefreshControl()
        collectionViewWithMultipleSection.refreshControl?.addTarget(self, action: #selector(pullDownToRefresh), for: .valueChanged)
    }
    
    private func loadSearchBar() {
        searchTextField.delegate = self
        searchTextField.backgroundColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1)
        searchTextField.addPadding(padding: .left(48))
        searchTextField.addPadding(padding: .right(34))
        searchTextField.becomeFirstResponder()
    }
    
    private func setupView() {
        navigationController?.isNavigationBarHidden = true
//        navLabel.text = "Search"

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // load collection 2 types here  with 1 section or 2 section

        collectionViewWithSingleSection.frame = containerView.bounds
        collectionViewWithMultipleSection.frame = containerView.bounds
        searchTextField.layer.cornerRadius = (searchView.frame.size.height / 2.0 ) - 1.0
        
    }
    
    @objc private func pullDownToRefresh() {
        print("Refresh")
        
//        selectedItem = []
        
        searchTextField.text = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.collectionViewWithSingleSection.reloadData()
            self.collectionViewWithSingleSection.refreshControl?.endRefreshing()

            self.collectionViewWithMultipleSection.reloadData()
            self.collectionViewWithMultipleSection.refreshControl?.endRefreshing()
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.isNavigationBarHidden = false
        navigationController?.popViewController(animated: false)
    }

}



extension SearchViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if searched {
            if resultFound {
                //load results
                return 1
            }
            else {
                //load not found + recommended
                return 2
            }
        }
        else {
            //load top searches
            return 1
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if searched {
            if resultFound {
                //load results
                return resultsData.sections[section].cells.count
            }
            else {
                //load not found + recommended
                if section == 0 {
//                    return resultsData.sections[section].cells.count
                    return 1
                }
                else {
                    return recommendedShowsData.sections[section - 1].cells.count
                }
            }
        }
        else {
            //load top searches
            return topSearchesData.sections[section].cells.count
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //        print("supp indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        
        if searched {
            if resultFound {
                //load results
                switch kind {
                case SearchViewController.headerKind:
                    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeaderCollectionReusableView.headerIdentifier, for: indexPath) as! CustomHeaderCollectionReusableView
                    header.setup(head: resultsData.sections[indexPath.section].headerFooter.header, font: .systemFont(ofSize: 24, weight: .bold), imageFlag: false)
                    return header
                    
                case SearchViewController.footerKind:
                    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                    footer.setup(foot: resultsData.sections[indexPath.section].headerFooter.footer, indicatorFlag: false)
                    return footer
                    
                default:
                    return UICollectionReusableView()
                }
            }
            
            else {
                //load not found + recommended
                if indexPath.section == 0 {
                    switch kind {
                    case SearchViewController.headerKind:
                        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeaderCollectionReusableView.headerIdentifier, for: indexPath) as! CustomHeaderCollectionReusableView
                        header.setup(head: resultsData.sections[indexPath.section].headerFooter.header, font: .systemFont(ofSize: 24, weight: .bold), imageFlag: false)
                        return header
                        
                    case SearchViewController.footerKind:
                        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                        footer.setup(foot: resultsData.sections[indexPath.section].headerFooter.footer, indicatorFlag: false)
                        return footer
                        
                    default:
                        return UICollectionReusableView()
                    }
                }
                
                else {
                    switch kind {
                    case SearchViewController.headerKind:
                        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeaderCollectionReusableView.headerIdentifier, for: indexPath) as! CustomHeaderCollectionReusableView
                        header.setup(head: recommendedShowsData.sections[indexPath.section - 1].headerFooter.header, font: .systemFont(ofSize: 24, weight: .bold), imageFlag: false)
                        return header
                        
                    case SearchViewController.footerKind:
                        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                        footer.setup(foot: recommendedShowsData.sections[indexPath.section - 1].headerFooter.footer, indicatorFlag: false)
                        return footer
                        
                    default:
                        return UICollectionReusableView()
                    }
                }
            }
        }
        else {
            //load top searches
            switch kind {
            case SearchViewController.headerKind:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeaderCollectionReusableView.headerIdentifier, for: indexPath) as! CustomHeaderCollectionReusableView
                header.setup(head: topSearchesData.sections[indexPath.section].headerFooter.header, font: .systemFont(ofSize: 24, weight: .bold), imageFlag: false)
                return header
                
            case SearchViewController.footerKind:
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                footer.setup(foot: topSearchesData.sections[indexPath.section].headerFooter.footer, indicatorFlag: false)
                return footer
                
            default:
                return UICollectionReusableView()
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if searched {
            if resultFound {
                //load results
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomListCollectionViewCell.identifier, for: indexPath) as! CustomListCollectionViewCell
                cell.setup(
                    image: resultsData.sections[indexPath.section].cells[indexPath.item].image,
                    title: resultsData.sections[indexPath.section].cells[indexPath.item].title ?? "Title",
                    hideProgress: true,
                    duration: resultsData.sections[indexPath.section].cells[indexPath.item].duration ?? "Duration"
                )
                //            cell.backgroundColor = .orange
                return cell
            }
            
            else {
                //load not found + recommended
                if indexPath.section == 0 {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomNoResultCollectionViewCell.identifier, for: indexPath) as! CustomNoResultCollectionViewCell
                    //            cell.backgroundColor = .orange
                    return cell
                }
                
                else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomListCollectionViewCell.identifier, for: indexPath) as! CustomListCollectionViewCell
                    cell.setup(
                        image: recommendedShowsData.sections[indexPath.section - 1].cells[indexPath.item].image,
                        title: recommendedShowsData.sections[indexPath.section - 1].cells[indexPath.item].title ?? "Title",
                        hideProgress: true,
                        duration: recommendedShowsData.sections[indexPath.section - 1].cells[indexPath.item].duration ?? "Duration"
                    )
                    //            cell.backgroundColor = .orange
                    return cell
                }
            }
        }
        else {
            //load top searches
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomListCollectionViewCell.identifier, for: indexPath) as! CustomListCollectionViewCell
            cell.setup(
                image: topSearchesData.sections[indexPath.section].cells[indexPath.item].image,
                title: topSearchesData.sections[indexPath.section].cells[indexPath.item].title ?? "Title",
                hideProgress: true,
                duration: topSearchesData.sections[indexPath.section].cells[indexPath.item].duration ?? "Duration"
            )
            //            cell.backgroundColor = .orange
            return cell
        }
    }
    
}


extension SearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt  \(indexPath)")
        
        if collectionView == collectionViewWithMultipleSection && indexPath.section == 1{
            // send to new vc
            let vc = UIViewController()
            vc.view.backgroundColor = indexPath.item == 0 ? .yellow : indexPath.item == 1 ? .blue : indexPath.item == 2 ? .orange : .green
            navigationController?.pushViewController(vc, animated: true)
    
        }
        
        else if collectionView == collectionViewWithSingleSection && indexPath.section == 0 {
            // send to new vc
            let vc = UIViewController()
            vc.view.backgroundColor = indexPath.item == 0 ? .yellow : indexPath.item == 1 ? .blue : indexPath.item == 2 ? .orange : .green

            navigationController?.pushViewController(vc, animated: true)
            navigationController?.isNavigationBarHidden = false
            
        }
    }


    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("didDeselectItemAt  \(indexPath)")

    }
    
    
}


extension SearchViewController: UITextViewDelegate {
//    func textViewDidChange(_ textView: UITextView) {
//        print("textViewDidChange")
//    }
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("textFieldDidChangeSelection")
        
        // logic check for loading collectionview
        
        if textField.text == "" {
            // change flags
            searched = false
            resultFound = false
            
            // load top searches
            collectionViewWithMultipleSection.removeFromSuperview()
            loadCollectionViewWithSingleSection()
            self.collectionViewWithSingleSection.reloadData()
        }
        
        if textField.text != "" {
            // change flags
            searched = true
            resultFound = false
            
            if searched /* searched true state*/ {
                // filter text
                if  textField.text == "red" /* matched*/ {
                    searched = true
                    resultFound = true
                    
                    //                    for word in carData {
                    //                        if word.uppercased().contains((textField.text?.uppercased())!) {
                    //                            filteredData.append(word)
                    //                        }
                    //                    }
                    
                    // append into resultsdata
                    
//                    if same thing goes in again dont append
//                    if not append searched in result
                    resultsData.sections[0].cells.append(CellDataType(image: "image 16", label: "3",  title: "Red", progress: 0.3, duration: "3h 23 m remaining"))
                    
                    // load results
                    collectionViewWithMultipleSection.removeFromSuperview()
                    loadCollectionViewWithSingleSection()
                    self.collectionViewWithSingleSection.reloadData()
                    
                    
                }
                
                else /* not matched*/ {
                    searched = true
                    resultFound = false
                    
                    // clean resultsdata
                    resultsData.sections[0].cells.removeAll()
                    
                    // load emtpty results and recommendation
                    collectionViewWithSingleSection.removeFromSuperview()
                    loadCollectionViewWithMultipleSection()
                    self.collectionViewWithMultipleSection.reloadData()
                    
                }
            }
            else /* searched false state*/{
                // change flags
                searched = false
                resultFound = false
                
                // load top searches
                collectionViewWithMultipleSection.removeFromSuperview()
                loadCollectionViewWithSingleSection()
                self.collectionViewWithSingleSection.reloadData()
            }
        }
    }
    
    //textfield func for the touch on BG
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchTextField.resignFirstResponder()
        self.view.endEditing(true)
    }
}





//if searched {
//    if resultFound {
//        //load results
//    }
//    else {
//        //load not found + recommended
//    }
//}
//else {
//    //load top searches
//}



//for word in topSearchesData.sections[0].cells {
//
////                    if  textField.text == "red" /* matched*/ {
//    if  word.title!.uppercased().contains((textField.text?.uppercased())!) /* matched*/ {
//        resultFound = true






//
//if textField.text != "" {
//    // change flags
//    searched = true
//
////            // load results
////            collectionViewWithMultipleSection.removeFromSuperview()
////            loadCollectionViewWithSingleSection()
////            self.collectionViewWithSingleSection.reloadData()
//
//    if searched /* searched true state*/ {
//        // filter text
//        for item in topSearchesData.sections[0].cells {
//            if item.title!.uppercased().contains((textField.text?.uppercased())!) /* matched*/ {
//                resultFound = true
//                resultsData.sections[0].cells.append(item)
//                print(item)
//
////                        collectionViewWithMultipleSection.removeFromSuperview()
////                        loadCollectionViewWithSingleSection()
//                self.collectionViewWithSingleSection.reloadData()
//            }
//            else /* not matched*/{
//                resultFound = false
//
//                // clean resultsdata
//                resultsData.sections[0].cells.removeAll()
//
//                // load emtpty results and recommendation
//                collectionViewWithSingleSection.removeFromSuperview()
//                loadCollectionViewWithMultipleSection()
//                self.collectionViewWithMultipleSection.reloadData()
//            }
//        }
////
////
////                if  textField.text == "red" /* matched*/ {
////                    resultFound = true
////
//////                    for word in carData {
//////                        if word.uppercased().contains((textField.text?.uppercased())!) {
//////                            filteredData.append(word)
//////                        }
//////                    }//for word in topSearchesData.sections[0].cells {
////                    //
////                    ////                    if  textField.text == "red" /* matched*/ {
////                    //    if  word.title!.uppercased().contains((textField.text?.uppercased())!) /* matched*/ {
////                    //        resultFound = true
////
//////
////                    // append into resultsdata
////
//////                    resultsData.sections[0].cells.append(CellDataType(image: "image 16", label: "3",  title: "Red", progress: 0.3, duration: "3h 23 m remaining"))
////
////                    // load results
////                    collectionViewWithMultipleSection.removeFromSuperview()
////                    loadCollectionViewWithSingleSection()
////                    self.collectionViewWithSingleSection.reloadData()
////
////                }
////    //
////                else /* not matched*/ {
////                    resultFound = false
////
////                    // clean resultsdata
////                    resultsData.sections[0].cells.removeAll()
////
////                    // load emtpty results and recommendation
////                    collectionViewWithSingleSection.removeFromSuperview()
////                    loadCollectionViewWithMultipleSection()
////                    self.collectionViewWithMultipleSection.reloadData()
////
////                }
//    }
//    else /* searched false state*/{
//        // change flags
//        searched = false
//        resultFound = false
//
//        // load top searches
//        collectionViewWithMultipleSection.removeFromSuperview()
//        loadCollectionViewWithSingleSection()
//        self.collectionViewWithSingleSection.reloadData()
//    }
//
//
////            filteredData = []
//}
//
////        for word in carData {
////            if word.uppercased().contains((textField.text?.uppercased())!) {
////                filteredData.append(word)
////            }
////        }
////            self.collectionView.reloadData()
//print(filteredData)
//
//}
//
////    private func inputValidation() {
////        if phoneNumberTextField.text?.count == maxLengthPhoneNumber {
//////            phoneNumberTextField.resignFirstResponder() //
//////            self.view.endEditing(true)
////
////            if termSeletionButton.isSelected {
////                nextButtonImageView.image = UIImage(named: "Group 229 (3)")
////                nextButton.isUserInteractionEnabled = true
////            }
////            else {
////                nextButtonImageView.image = UIImage(named: "Group 229")
////                nextButton.isUserInteractionEnabled = false
////            }
////        }
////        else {
////            nextButtonImageView.image = UIImage(named: "Group 229")
////            nextButton.isUserInteractionEnabled = false
////        }
////    }
