//
//  UILabel+Chainable.swift
//  TestBed
//
//  Created by sokol on 2022/01/31.
//

import UIKit

extension Chain where Origin: UILabel {
    func text(_ text: String) -> Chain {
        origin.text = text
        return self
    }
    
    func font(_ font: UIFont) -> Chain {
        origin.font = font
        return self
    }
    
    func font(size: CGFloat, weight: UIFont.Weight ) -> Chain {
        return self.font(UIFont.systemFont(ofSize: size, weight: weight))
    }
    
    func color(_ color: UIColor) -> Chain {
        origin.textColor = color
        return self
    }
    
}
