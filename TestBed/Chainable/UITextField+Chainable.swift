//
//  UITextField+Chainable.swift
//  TestBed
//
//  Created by sokol on 2022/02/03.
//

import UIKit

extension Chain where Origin: UITextField {
    
    func border(_ borderStyle: UITextField.BorderStyle = .none)  -> Chain {
        origin.borderStyle = borderStyle
        return self
    }
    
    func keyboardType(_ type: UIKeyboardType = .default) -> Chain {
        origin.keyboardType = type
        return self
    }
    
    func secure(_ secure: Bool = true) -> Chain {
        origin.isSecureTextEntry = secure
        return self
    }
    
    
    
}
