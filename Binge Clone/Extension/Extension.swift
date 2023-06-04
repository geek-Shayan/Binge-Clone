//
//  Extension.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 4/6/23.
//

import UIKit


// MARK: Custom UITextField padding extension

// Usage:

    // equal padding
    //yourTextField.addPadding(padding: .equalSpacing(10))

    // padding right
    //yourTextField.addPadding(padding: .right(10))

    // padding left
    //yourTextField.addPadding(padding: .left(10))

extension UITextField {
    
    enum PaddingSpace {
        case left(CGFloat)
        case right(CGFloat)
        case equalSpacing(CGFloat)
    }

    func addPadding(padding: PaddingSpace) {

        self.leftViewMode = .always
        self.layer.masksToBounds = true

        switch padding {

        case .left(let spacing):
            let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = leftPaddingView
            self.leftViewMode = .always

        case .right(let spacing):
            let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = rightPaddingView
            self.rightViewMode = .always

        case .equalSpacing(let spacing):
            let equalPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = equalPaddingView
            self.leftViewMode = .always
            // right
            self.rightView = equalPaddingView
            self.rightViewMode = .always
        }
    }
}



// MARK: Custom UINavigationBar layer toggle extension

extension UINavigationBar {
    func toggle() {
        if self.layer.zPosition == -1 {
            self.layer.zPosition = 0
            self.isUserInteractionEnabled = true
        } else {
            self.layer.zPosition = -1
            self.isUserInteractionEnabled = false
        }
    }
}



// MARK: Custom UITabBar layer toggle extension

extension UITabBar {
    func toggle() {
        if self.layer.zPosition == -1 {
            self.layer.zPosition = 0
            self.isUserInteractionEnabled = true
        } else {
            self.layer.zPosition = -1
            self.isUserInteractionEnabled = false
        }
    }
}



// MARK: Custom UIView fade in/out animation extension

extension UIView {
   func fadeIn() {
       // Move our fade out code from earlier
       UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
           self.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
           }, completion: nil)
    }

    func fadeOut() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
            self.alpha = 0.0
            }, completion: nil)
    }
}
