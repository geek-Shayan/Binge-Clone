//
//  GenreViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 5/6/23.
//

import UIKit

class GenreViewController: UIViewController {

    @IBOutlet weak var genreCollectionView: UICollectionView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    
    private let genreNames = ["Action", "Comedy", "Fashion", "History", "Horror", "Kids", "Romance", "Fantasy/SCI-FI", "Drama", "Family", "Sports", "Thriller", "Crime", "Pop", "Music", "War", "Educational", "Tragedy", "Game", "Reality Show"]
    
    private var finalSelections = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        loadActionCollection()
    }
    
    func loadActionCollection() {
        genreCollectionView.register(UINib(nibName: "CustomGenreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomGenreCollectionViewCell.identifier)
        
        genreCollectionView.allowsMultipleSelection = true
    }
    
    private func setupView() {
        continueButton.layer.cornerRadius = 10
        continueButton.isUserInteractionEnabled = false
        
        skipButton.layer.cornerRadius = 10
    }
    
    @IBAction func continuePressed(_ sender: Any) {
        if continueButton.isUserInteractionEnabled {
            print("continuePressed")
            
            let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
            navigationController?.pushViewController(tabBarController, animated: true)
        }
        else {
            print("disabled")
        }
    }
    
    @IBAction func skipPressed(_ sender: Any) {
        print("skipPressed")
        
        let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
        navigationController?.pushViewController(tabBarController, animated: true)
    }
    

}



extension GenreViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomGenreCollectionViewCell
        
        if cell.isSelected == true {
            cell.selected()
            
            finalSelections.append(genreNames[indexPath.row])
            print("append  \(finalSelections)")
            
            continueButton.backgroundColor = UIColor(red: 0.898, green: 0.035, blue: 0.078, alpha: 1) //red
            continueButton.isUserInteractionEnabled = true

        }
    }

    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomGenreCollectionViewCell
        
        // last deselection, before emptying selection array
        if cell.isSelected == false && finalSelections.count == 1 {
            cell.deSelected()
            
            finalSelections.removeAll { $0 == genreNames[indexPath.row] } //(genreNames[indexPath.row])
            print("removed if  \(finalSelections)")
            
            continueButton.backgroundColor = UIColor(red: 0.255, green: 0.255, blue: 0.255, alpha: 1) //gray
            continueButton.isUserInteractionEnabled = false
        }
        
        // normal deselection, selection array not empty
        else {
            cell.deSelected()
            
            finalSelections.removeAll { $0 == genreNames[indexPath.row] } //(genreNames[indexPath.row])
            print("removed else  \(finalSelections)")
        }

    }

}



extension GenreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomGenreCollectionViewCell.identifier, for: indexPath) as! CustomGenreCollectionViewCell
        
        if cell.isSelected == true {
            cell.selected()
            cell.setup(label: genreNames[indexPath.row])
            return cell
        }
        
        else {
            cell.deSelected()
            cell.setup(label: genreNames[indexPath.row])
            return cell
        }
    }
    
    
}
