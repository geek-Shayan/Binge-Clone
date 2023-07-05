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
    
    
    private let categoryNames = ["Action", "Comedy", "Fashion", "History", "Horror", "Kids", "Romance", "Fantasy/SCI-FI", "Drama", "Family", "Sports", "Thriller", "Crime", "Pop", "Music", "War", "Educational", "Tragedy", "Game", "Reality Show"]
    
    private var finalSelection = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Binge"
        
        setupView()
        
        loadCategoriesCollection()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        categoriesCollectionView.sendSubviewToBack(view)
    }
    
    func loadCategoriesCollection() {
        categoriesCollectionView.register(UINib(nibName: "CustomCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomCategoriesCollectionViewCell.identifier)
        
//        categoriesCollectionView.allowsMultipleSelection = true
    }
    
    private func setupView() {
        self.navigationItem.hidesBackButton = true
//        self.navigationItem.setHidesBackButton(true, animated: true)


    }

    
    @IBAction func skipPressed(_ sender: Any) {
        print("skipPressed")
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.popViewController(animated: false)
//        self.navigationController?.dismiss(animated: false)
//        self.dismiss(animated: false)
        
    }
    

}



extension CategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCategoriesCollectionViewCell
        
        if cell.isSelected {
            finalSelection = categoryNames[indexPath.row]
            print("selected  \(finalSelection)")
            
            // pass to new vc
            let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
            
//            super.navigationController?.pushViewController(vc, animated: true)
//            self.parent?.navigationController?.pushViewController(vc, animated: true)
            
//            UINavigationController().pushViewController(vc, animated: true)
//                .pushViewController(vc, animated: true)
//            present(vc, animated: true)
//            self.navigationController?.pushViewController(vc, animated: true)
            self.navigationController?.isNavigationBarHidden = false
            self.navigationController?.pushViewController(vc, animated: true)
            
//            show(vc, sender: self)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController(animated: false)
    }

}



extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCategoriesCollectionViewCell.identifier, for: indexPath) as! CustomCategoriesCollectionViewCell
    
        cell.setup(label: categoryNames[indexPath.row])

        return cell
    }
    
    
}
