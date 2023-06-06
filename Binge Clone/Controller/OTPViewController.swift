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
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextButtonImageView: UIImageView!
    
    private let maxLengthPhoneNumber = 1
    private let acceptableNumbers = "0123456789"
    
    private var OTP = "OTP"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true

        setupView()
    }
    

    private func setupView() {
        
        otpTextField1.delegate = self
        otpTextField1.layer.borderWidth = 1
        otpTextField1.layer.cornerRadius = 8
        otpTextField1.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        otpTextField1.becomeFirstResponder()
        
        otpTextField2.delegate = self
        otpTextField2.layer.borderWidth = 1
        otpTextField2.layer.cornerRadius = 8
        otpTextField2.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
        otpTextField3.delegate = self
        otpTextField3.layer.borderWidth = 1
        otpTextField3.layer.cornerRadius = 8
        otpTextField3.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
        otpTextField4.delegate = self
        otpTextField4.layer.borderWidth = 1
        otpTextField4.layer.cornerRadius = 8
        otpTextField4.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
        nextButton.isUserInteractionEnabled = false
        
    }
    
    private func inputValidation() {
        
    }

    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextPressed(_ sender: Any) {
        if nextButton.isUserInteractionEnabled {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "GenreViewController") as! GenreViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            print("disabled")
        }
    }
    
    @IBAction func resendOTPPressed(_ sender: Any) {
        otpTextField1.text = nil
        otpTextField2.text = nil
        otpTextField3.text = nil
        otpTextField4.text = nil
        
        nextButtonImageView.image = UIImage(named: "Group 229")
        nextButton.isUserInteractionEnabled = false
        
        otpTextField1.becomeFirstResponder()
        
//        nextButtonImageView.image = UIImage(named: "Group 229 (3)")
//        nextButton.isUserInteractionEnabled = true
    }
    
}


extension OTPViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("textFieldDidChangeSelection  otp")
        
//        print(otpTextField1.text)
//        print(otpTextField2.text)
//        print(otpTextField3.text)
//        print(otpTextField4.text)
        
//        inputValidation()
        
        
        if otpTextField1.text != "" {
            print("TF 1 not nil")
            otpTextField1.resignFirstResponder()
            otpTextField2.becomeFirstResponder()
        }
        if otpTextField2.text != "" {
            print("TF 2 not nil")
            otpTextField2.resignFirstResponder()
            otpTextField3.becomeFirstResponder()
        }
        if otpTextField3.text != "" {
            print("TF 3 not nil")
            otpTextField3.resignFirstResponder()
            otpTextField4.becomeFirstResponder()
        }
        if otpTextField4.text != "" {
            print("TF 4 not nil")
            otpTextField4.resignFirstResponder()
        }
        
        if !otpTextField1.text!.isEmpty && !otpTextField2.text!.isEmpty && !otpTextField3.text!.isEmpty && !otpTextField4.text!.isEmpty {
            print("TF not nil")

            OTP = "\(otpTextField1.text!)\(otpTextField2.text!)\(otpTextField3.text!)\(otpTextField4.text!)"
            print("OTP  \(OTP)")
             
            nextButtonImageView.image = UIImage(named: "Group 229 (3)")
            nextButton.isUserInteractionEnabled = true
        }
        else {
            print("TF nil")
            nextButtonImageView.image = UIImage(named: "Group 229")
            nextButton.isUserInteractionEnabled = false
        }
        
        
        
        
        
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength: Int = textField.text!.count + string.count - range.length
        let numberOnly = NSCharacterSet.init(charactersIn: acceptableNumbers).inverted
        let strValid = string.rangeOfCharacter(from: numberOnly) == nil
        return (strValid && (newLength <= maxLengthPhoneNumber))
    }
    

    //textfield func for the touch on BG
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        otpTextField1.resignFirstResponder()
        self.view.endEditing(true)
    }
 
}
