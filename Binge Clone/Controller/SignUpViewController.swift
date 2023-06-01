//
//  SignUpViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 29/5/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var termSeletionButton: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextButtonImageView: UIImageView!
    @IBOutlet weak var nextButtonView: UIView!
    @IBOutlet weak var nextButtonViewTopConstant: NSLayoutConstraint!
    @IBOutlet weak var conuntryCodeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        nextButtonViewTopConstant.constant = -(nextButtonView.frame.height / 2)
        
        phoneNumberTextField.layer.borderWidth = 1
        phoneNumberTextField.layer.cornerRadius = 8
//        phoneNumberTextField.layer.maskedCorners = .layerMinXMinYCorner
//        phoneNumberTextField.textRect(forBounds: CGRect(x: 10, y: 10, width: 15, height: 5))
//        phoneNumberTextField.textRect(forBounds: CGRect)
//        phoneNumberTextField.borderStyle = .roundedRect
        phoneNumberTextField.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
        conuntryCodeTextField.layer.borderWidth = 1
        conuntryCodeTextField.layer.cornerRadius = 8
        conuntryCodeTextField.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor

        termSeletionButton.setImage(UIImage(named: "Ellipse 5"), for: .normal)
        termSeletionButton.setImage(UIImage(named: "Ellipse 5 (3)"), for: .selected)
    }
    
    @IBAction func termSeletionPressed(_ sender: Any) {
        termSeletionButton.isSelected = !termSeletionButton.isSelected
        
    }

    
    
    @IBAction func PhoneNumberEditing(_ sender: Any) {
//        if phoneNumberTextField.text == "" && termSeletionButton.isSelected == true{
            nextButtonImageView.image = UIImage(named: "Group 229 (3)")
//        }
//        else {
//            nextButtonImageView.image = UIImage(named: "Group 229")
//
//        }
        
    }
    
    @IBAction func nextPressed(_ sender: Any) {
//        nextButton.setImage(UIImage(named: "Group 229 (3)"), for: .normal)
        
        nextButtonImageView.image = UIImage(named: "Group 229 (3)")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}



//class phoneNumberTextField: UITextField {
//
//    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
//
//    override open func textRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.inset(by: padding)
//    }
//
//    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.inset(by: padding)
//    }
//
//    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.inset(by: padding)
//    }
//}
