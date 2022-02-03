//
//  UIButton+Chainable.swift
//  TestBed
//
//  Created by sokol on 2022/02/03.
//

import UIKit

extension Chain where Origin: UIButton {
    func title(_ text: String, for state: UIControl.State = .normal) -> Chain {
        origin.setTitle(text, for: state)
        return self
    }
    
    func titleColor(_ color: UIColor, for state: UIControl.State = .normal) -> Chain {
        origin.setTitleColor(color, for: state)
        return self
    }
    
    func titleFont(font: UIFont) -> Chain {
        origin.titleLabel?.font = font
        return self
    }
    
    func titleFont(size: CGFloat, weight: UIFont.Weight) -> Chain {
        return titleFont(font: UIFont.systemFont(ofSize: size, weight: weight))
    }
    
}
