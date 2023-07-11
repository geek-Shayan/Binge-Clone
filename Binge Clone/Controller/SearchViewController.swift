//
//  SearchViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 10/7/23.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadTableview()
        
    }
 
    private func loadTableview() {
        tableView.register(UINib(nibName: "CustomSearchListTableViewCell", bundle: nil), forCellReuseIdentifier: CustomSearchListTableViewCell.identifier)
        
//        view.addSubview(actionContainerView)
        
//        actionContainerView.backgroundColor = .gray // blur
//        actionContainerView.backgroundColor = .clear
//        actionTableView.backgroundColor = .orange
        
//        actionContainerView.isHidden = true
//
//        actionOpen = false
    }
}


extension SearchViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        // retuen height of row
//        return 81
//    }
}


extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 4
        return myListSectionsData.sections[2].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.backgroundColor = .orange
//        cell.textLabel?.text = "sdfgkss"
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomSearchListTableViewCell.identifier, for: indexPath) as! CustomSearchListTableViewCell
        cell.setup(
            image: myListSectionsData.sections[2].cells[indexPath.item].image,
            title: myListSectionsData.sections[2].cells[indexPath.item].title ?? "Title",
            progress: myListSectionsData.sections[2].cells[indexPath.item].progress ?? 0.5,
            duration: myListSectionsData.sections[2].cells[indexPath.item].duration ?? "Duration"
        )
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Top Searches"
    }
}
