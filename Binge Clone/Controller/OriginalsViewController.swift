//
//  OriginalsViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 25/5/23.
//

import UIKit

class OriginalsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.title = "Binge"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionButtonPressed(_ sender: UIBarButtonItem) {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true)
    }
    


}
