//
//  CategoriesViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 15/6/23.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var skipButton: UIButton!
    
    
    private let categoryNames = ["Action", "Comedy", "Fashion", "History", "Horror", "Kids", "Romance", "Fantasy/SCI-FI", "Drama", "Family", "Sports", "Thriller", "Crime", "Pop", "Music", "War", "Educational", "Tragedy", "Game", "Reality Show", "Action", "Comedy", "Fashion", "History", "Horror", "Kids", "Romance", "Fantasy/SCI-FI", "Drama", "Family", "Sports", "Thriller", "Crime", "Pop", "Music", "War", "Educational", "Tragedy", "Game", "Reality Show", "Action", "Comedy", "Fashion", "History", "Horror", "Kids", "Romance", "Fantasy/SCI-FI", "Drama", "Family", "Sports", "Thriller", "Crime", "Pop", "Music", "War", "Educational", "Tragedy", "Game", "Reality Show"]
    
    private var finalSelections = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        loadActionCollection()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        categoriesCollectionView.sendSubviewToBack(view)
    }
    
    func loadActionCollection() {
        categoriesCollectionView.register(UINib(nibName: "CustomCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomCategoriesCollectionViewCell.identifier)
        
        categoriesCollectionView.allowsMultipleSelection = true
    }
    
    private func setupView() {
//        continueButton.layer.cornerRadius = 10
//        continueButton.isUserInteractionEnabled = false
//
//        skipButton.layer.cornerRadius = 10
    }

    
    @IBAction func skipPressed(_ sender: Any) {
        print("skipPressed")
        
//        let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
//        navigationController?.pushViewController(tabBarController, animated: true)
        
        self.dismiss(animated: true, completion: nil)
    }
    

}



extension CategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCategoriesCollectionViewCell
        
        if cell.isSelected == true {
            cell.selected()
            
            finalSelections.append(categoryNames[indexPath.row])
            print("append  \(finalSelections)")
            
//            continueButton.backgroundColor = UIColor(red: 0.898, green: 0.035, blue: 0.078, alpha: 1) //red
//            continueButton.isUserInteractionEnabled = true

        }
    }

    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCategoriesCollectionViewCell
        
        // last deselection, before emptying selection array
        if cell.isSelected == false && finalSelections.count == 1 {
            cell.deSelected()
            
            finalSelections.removeAll { $0 == categoryNames[indexPath.row] } //(genreNames[indexPath.row])
            print("removed if  \(finalSelections)")
            
//            continueButton.backgroundColor = UIColor(red: 0.255, green: 0.255, blue: 0.255, alpha: 1) //gray
//            continueButton.isUserInteractionEnabled = false
        }
        
        // normal deselection, selection array not empty
        else {
            cell.deSelected()
            
            finalSelections.removeAll { $0 == categoryNames[indexPath.row] } //(genreNames[indexPath.row])
            print("removed else  \(finalSelections)")
        }

    }

}



extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCategoriesCollectionViewCell.identifier, for: indexPath) as! CustomCategoriesCollectionViewCell
        
        if cell.isSelected == true {
            cell.selected()
            cell.setup(label: categoryNames[indexPath.row])
            return cell
        }
        
        else {
            cell.deSelected()
            cell.setup(label: categoryNames[indexPath.row])
            return cell
        }
    }
    
    
}
