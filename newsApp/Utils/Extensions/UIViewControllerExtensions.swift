//
//  UIViewControllerExtensions.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import UIKit

extension UIViewController: UITextFieldDelegate {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
