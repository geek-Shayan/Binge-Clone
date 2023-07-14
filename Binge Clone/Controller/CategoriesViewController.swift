//
//  CategoriesViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 15/6/23.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var stopButton: UIButton!
    
    
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
    }
    
    func loadCategoriesCollection() {
        categoriesCollectionView.register(UINib(nibName: "CustomCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomCategoriesCollectionViewCell.identifier)
    }
    
    private func setupView() {
//        self.navigationItem.hidesBackButton = true
//        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true


    }

    
    @IBAction func stopPressed(_ sender: Any) {
        print("skipPressed")
//        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.isNavigationBarHidden = false
//        self.navigationController?.popViewController(animated: false)
//        self.navigationController?.dismiss(animated: false)
        self.dismiss(animated: false)
        
    }
    

}



extension CategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath  \(indexPath)")
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCategoriesCollectionViewCell
        
        if cell.isSelected {
            finalSelection = categoryNames[indexPath.row]
            print("selected  \(finalSelection)")
            
            // pass to new vc / navbar
            let navbar = storyboard?.instantiateViewController(withIdentifier: "CategoryViewNavigationController") as! UINavigationController
            navbar.modalPresentationStyle = .overCurrentContext
            navbar.modalTransitionStyle = .crossDissolve
            self.present(navbar, animated: true)
        }
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
////        self.navigationController?.popViewController(animated: false)
//        self.dismiss(animated: false)
//    }

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
