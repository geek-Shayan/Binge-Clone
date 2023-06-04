//
//  OTPViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 1/6/23.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet weak var otpTextField1: UITextField!
    @IBOutlet weak var otpTextField2: UITextField!
    @IBOutlet weak var otpTextField3: UITextField!
    @IBOutlet weak var otpTextField4: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.isNavigationBarHidden = true

        setupView()
    
    }
    

    private func setupView() {
        
        otpTextField1.layer.borderWidth = 1
        otpTextField1.layer.cornerRadius = 8
        otpTextField1.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
        otpTextField2.layer.borderWidth = 1
        otpTextField2.layer.cornerRadius = 8
        otpTextField2.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
        otpTextField3.layer.borderWidth = 1
        otpTextField3.layer.cornerRadius = 8
        otpTextField3.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
        otpTextField4.layer.borderWidth = 1
        otpTextField4.layer.cornerRadius = 8
        otpTextField4.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
    }
    

    @IBAction func backPressed(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
}
