//
//  SignUpViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 29/5/23.
//

import UIKit
//import AuthenticationServices

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var conuntryCodeTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var termSeletionButton: UIButton!
    @IBOutlet weak var nextButtonView: UIView!
    @IBOutlet weak var nextButtonImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextButtonViewTopConstant: NSLayoutConstraint!
    @IBOutlet weak var appleSignInButton: UIButton!
    
    
    let MAX_LENGTH_PHONENUMBER = 10
    let ACCEPTABLE_NUMBERS     = "0123456789"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.isNavigationBarHidden = true

        setupView()
    }
    
    private func setupView() {
        nextButtonViewTopConstant.constant = -(nextButtonView.frame.height / 2)
        
        phoneNumberTextField.delegate = self
        phoneNumberTextField.layer.borderWidth = 1
        phoneNumberTextField.layer.cornerRadius = 8
        phoneNumberTextField.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        phoneNumberTextField.addPadding(padding: .equalSpacing(10))  // equal padding right, left
        phoneNumberTextField.becomeFirstResponder()
        
        conuntryCodeTextField.layer.borderWidth = 1
        conuntryCodeTextField.layer.cornerRadius = 8
        conuntryCodeTextField.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        conuntryCodeTextField.addPadding(padding: .right(10))  // right padding

        termSeletionButton.setImage(UIImage(named: "Ellipse 5"), for: .normal)
        termSeletionButton.setImage(UIImage(named: "Ellipse 5 (3)"), for: .selected)
    }
    
    @IBAction func termSeletionPressed(_ sender: Any) {
        termSeletionButton.isSelected = !termSeletionButton.isSelected
        
        if phoneNumberTextField.text?.count == 10 {
//            phoneNumberTextField.resignFirstResponder()
            self.view.endEditing(true)
            
            if termSeletionButton.isSelected {
                nextButtonImageView.image = UIImage(named: "Group 229 (3)")
            }
            else {
                nextButtonImageView.image = UIImage(named: "Group 229")
            }
        }
        else {
            nextButtonImageView.image = UIImage(named: "Group 229")
        }
        
    }

    
    @IBAction func nextPressed(_ sender: Any) {
        if nextButtonImageView.image == UIImage(named: "Group 229 (3)") {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            print("disabled")
        }
        
    }
}



extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("textFieldDidChangeSelection")
        
        if phoneNumberTextField.text?.count == 10 {
//            phoneNumberTextField.resignFirstResponder()
            self.view.endEditing(true)
            
            if termSeletionButton.isSelected {
                nextButtonImageView.image = UIImage(named: "Group 229 (3)")
            }
            else {
                nextButtonImageView.image = UIImage(named: "Group 229")
            }
        }
        else {
            nextButtonImageView.image = UIImage(named: "Group 229")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength: Int = textField.text!.count + string.count - range.length
        let numberOnly = NSCharacterSet.init(charactersIn: ACCEPTABLE_NUMBERS).inverted
        let strValid = string.rangeOfCharacter(from: numberOnly) == nil
        return (strValid && (newLength <= MAX_LENGTH_PHONENUMBER))
    }
    
    //03 textfield func for the return key
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        phoneNumberTextField.resignFirstResponder()
//      return true
//    }

    //textfield func for the touch on BG
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumberTextField.resignFirstResponder()
        self.view.endEditing(true)
    }
 
}



