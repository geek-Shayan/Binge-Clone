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
        otpTextField1.textContentType = .oneTimeCode
//        otpTextField1.becomeFirstResponder()
        
        otpTextField2.delegate = self
        otpTextField2.layer.borderWidth = 1
        otpTextField2.layer.cornerRadius = 8
        otpTextField2.textContentType = .oneTimeCode
        otpTextField2.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
        otpTextField3.delegate = self
        otpTextField3.layer.borderWidth = 1
        otpTextField3.layer.cornerRadius = 8
        otpTextField3.textContentType = .oneTimeCode
        otpTextField3.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
        otpTextField4.delegate = self
        otpTextField4.layer.borderWidth = 1
        otpTextField4.layer.cornerRadius = 8
        otpTextField4.textContentType = .oneTimeCode
        otpTextField4.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        
        nextButton.isUserInteractionEnabled = false
        
    }
    
    
    private func otpPaste(_ textField: UITextField, _ string: String) {
        if textField.textContentType == UITextContentType.oneTimeCode {
            otpTextField1.becomeFirstResponder()
            //split the text to four text fields
            otpTextField1.text = String(string[string.index(string.startIndex, offsetBy: 0)])
            otpTextField2.text = String(string[string.index(string.startIndex, offsetBy: 1)])
            otpTextField3.text = String(string[string.index(string.startIndex, offsetBy: 2)])
            otpTextField4.text = String(string[string.index(string.startIndex, offsetBy: 3)])
            otpTextField1.resignFirstResponder()
        }
    }
    
    
    private func otpSentToApi(_ textField: UITextField) {
        
        if otpTextField1.text != "" && otpTextField2.text != "" && otpTextField3.text != "" && otpTextField4.text != "" {
            print( "not '' check")
            textField.resignFirstResponder()//
            
            //api call
            OTP = "\(otpTextField1.text!)\(otpTextField2.text!)\(otpTextField3.text!)\(otpTextField4.text!)"
            print("OTP  \(OTP)")
            
            //api success
            nextButtonImageView.image = UIImage(named: "Group 229 (3)") //unlocked
            nextButton.isUserInteractionEnabled = true

        }
    }
    

    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextPressed(_ sender: Any) {
        if nextButton.isUserInteractionEnabled {
            print("====OTP Entered===", self.OTP)
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
        
        nextButtonImageView.image = UIImage(named: "Group 229") // locked
        nextButton.isUserInteractionEnabled = false
        
        otpTextField1.becomeFirstResponder()
    }
    
}


extension OTPViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("textFieldDidChangeSelection  otp")
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textFieldDidBeginEditing)
//        textField.text = nil
//        textField.deleteBackward()
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let numberOnly = NSCharacterSet(charactersIn: acceptableNumbers).inverted
        let strValid = string.rangeOfCharacter(from: numberOnly) == nil
        
        // number validation
        if (strValid) {
            
            // tf paste input
            if string.count == 4 {
                
                otpPaste(textField, string) //paste otp
                otpSentToApi(textField) //check for not empty & send api

                return false
            }
            
            // tf single input
            else if string.count == 1 {
                
                if textField == otpTextField1 {
                    otpTextField2.becomeFirstResponder()
                    textField.text? = string
                    
                    otpSentToApi(textField) //check for not empty & send api
                    
                }
                if textField == otpTextField2 {
                    if otpTextField1.text != "" {
                        
                        otpTextField3.becomeFirstResponder()
                        textField.text? = string
                    }
                    else {
                        otpTextField1.becomeFirstResponder()
                        otpTextField1.text = string
                        textField.becomeFirstResponder()
                    }
                    
                    otpSentToApi(textField) //check for not empty & send api
 
                }
                if textField == otpTextField3 {
                    if otpTextField2.text != "" {
                        
                        otpTextField4.becomeFirstResponder()
                        textField.text? = string
                    }
                    else {
                        otpTextField1.becomeFirstResponder()
                        otpTextField1.text = string
                        otpTextField2.becomeFirstResponder()
                    }
                    
                    otpSentToApi(textField) //check for not empty & send api
                    
                }
                if textField == otpTextField4 {
                    if otpTextField2.text != "" {
                        
                        otpTextField4.resignFirstResponder()
                        textField.text? = string
                    }
                    else {
                        otpTextField1.becomeFirstResponder()
                        otpTextField1.text = string
                        otpTextField2.becomeFirstResponder()
                    }
                    
                    otpSentToApi(textField) //check for not empty & send api

                }
                return false
            }
            else if string.count == 0 {
                
                if textField == otpTextField4 {
                    
                    otpTextField3?.becomeFirstResponder()
                    textField.text? = string
                }
                
                if textField == otpTextField3 {
                    
                    if otpTextField2.text != "" && otpTextField4.text != "" {
                        textField.becomeFirstResponder()
                        textField.text = string
                    }

                    else {
                        otpTextField2?.becomeFirstResponder()
                        textField.text? = string
                    }
                    
//                    otpTextField2?.becomeFirstResponder()
//                    textField.text? = string
                }
                
                if textField == otpTextField2 {
                    
                    if otpTextField1.text != "" && otpTextField3.text != "" {
                        textField.becomeFirstResponder()
                        textField.text = string
                    }

                    else {
                        otpTextField1?.becomeFirstResponder()
                        textField.text? = string
                    }
                    
//                    otpTextField1?.becomeFirstResponder()
//                    textField.text? = string
                }
                
                if textField == otpTextField1 {
                    otpTextField1?.becomeFirstResponder()
                    textField.text? = string
                }
                
                nextButtonImageView.image = UIImage(named: "Group 229") // locked
                nextButton.isUserInteractionEnabled = false

                return false
            }
            
            else {
                return false
            }
            
        }
        else {
            return strValid
        }
        
    }
    

    //textfield func for the touch on BG
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
 
}
