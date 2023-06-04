//
//  ActionViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 29/5/23.
//

import UIKit

class ActionViewController: UIViewController {
    
    @IBOutlet var actionContainer: UIView!
    
    @IBOutlet weak var actionTable: UITableView!
    
    var actionOpen: Bool = true
    
    var titleNames = ["Profile", "Edit Profile", "Support", "setting", "Profile", "Edit Profile", "Support", "setting"]
    var imageNames = [UIImage(systemName: "person"), UIImage(systemName: "pencil"), UIImage(systemName: "phone"), UIImage(systemName: "gearshape"), UIImage(systemName: "person"), UIImage(systemName: "pencil"), UIImage(systemName: "phone"), UIImage(systemName: "gearshape")]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadActionTable()
        
    }
    
    
    func loadActionTable() {
//        actionContainer.addSubview(actionTable)
        actionTable.register(UINib(nibName: "CustomActionTableViewCell", bundle: nil), forCellReuseIdentifier: CustomActionTableViewCell.identifier)
        
//        actionContainerView.backgroundColor = .gray // blur
//        actionContainerView.backgroundColor = .clear
//        actionTable.backgroundColor = .orange

        
//        actionContainer.isHidden = true
        
        actionOpen = false
        
    }
   
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)

    }
}



extension ActionViewController: UITableViewDelegate {
    
}


extension ActionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomActionTableViewCell.identifier, for: indexPath) as! CustomActionTableViewCell
        cell.actionImage.image = imageNames[indexPath.row]
        cell.actionLabel.text = titleNames[indexPath.row]
//        cell.backgroundColor = .brown
        return cell
    }
}
