//
//  SplashScreenViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 1/6/23.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    

}
