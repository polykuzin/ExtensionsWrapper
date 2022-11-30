//
//  Ext+UIViewController.swift
//  
//
//  Created by polykuzin on 15/11/2022.
//

import UIKit

public extension UIViewController {
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
