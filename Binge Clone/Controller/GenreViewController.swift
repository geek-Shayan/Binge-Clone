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
    
    
    private var titleNames = ["Action", "Comedy", "Fashion", "History", "Horror", "Kids", "Romance", "Fantasy/SCI-FI", "Drama", "Family", "Sports", "Thriller", "Crime", "Pop", "Music", "War", "Educational", "Tragedy", "Game", "Reality Show"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        genreCollectionView.register(UINib(nibName: "CustomGenreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomGenreCollectionViewCell.identifier)
        
        view.addSubview(genreCollectionView)
        
        
//        continueButton.layer.borderWidth = 1
        continueButton.layer.cornerRadius = 10
//        continueButton.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
//        skipButton.layer.borderWidth = 1
        skipButton.layer.cornerRadius = 10
//        skipButton.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
    }

}


extension GenreViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomGenreCollectionViewCell {
            cell.genreBackgroundView.backgroundColor = .red
            cell.genreBackgroundView.layer.borderWidth = 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomGenreCollectionViewCell {
            cell.genreBackgroundView.backgroundColor = .black
            cell.genreBackgroundView.layer.borderWidth = 1
        }

    }
}

extension GenreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomGenreCollectionViewCell.identifier, for: indexPath) as! CustomGenreCollectionViewCell
        
        cell.setup(buttonTitle: titleNames[indexPath.row])
//        cell.backgroundColor = .brown
        return cell
    }
    
    
}
