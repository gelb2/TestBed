//
//  UIView+Chainable.swift
//  TestBed
//
//  Created by sokol on 2022/01/31.
//

import UIKit
import SwiftUI

extension UIView: Chainable { }

extension Chain where Origin: UIView {
    func background(color: UIColor) -> Chain {
        origin.backgroundColor = color
        return self
    }
    
    func cornerRadius(_ r: CGFloat) -> Chain {
        origin.layer.cornerRadius = r
        origin.clipsToBounds = true
        return self
    }
    
    private func add(child: UIView, to parent: UIView) {
        if let parent = parent as? UIStackView {
            parent.addArrangedSubview(child)
        } else {
            parent.addSubview(child)
        }
    }
    
    func add<P: UIView>(to parent: P) -> Chain {
        add(child: origin, to: parent)
        return self
    }
    
    func add<V: UIView>(to parentChain: Chain<V>) -> Chain {
        return add(to: parentChain.origin)
    }
    
    func add<V: UIView>(child: V) -> Chain {
        add(child: child, to: origin)
        return self
    }
    
    func add<V: UIView>(child: Chain<V>) -> Chain {
        return add(child: child.origin)
    }
    
    func add<V: UIView>(children: V...) -> Chain {
        children.forEach { child in add(child: child, to: origin) }
        return self
    }
    
    func add<V: UIView>(children: Chain<V>...) -> Chain {
        children.map { $0.origin }.forEach { add(child: $0, to: origin) }
        return self
    }
    
    func size(width: CGFloat, height: CGFloat) -> Chain {
        origin.translatesAutoresizingMaskIntoConstraints = false
        origin.widthAnchor.constraint(equalToConstant: width).isActive = true
        origin.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        return self
    }
    
    func size(_ size: CGSize) -> Chain {
        return self.size(width: size.width, height: size.height)
    }
    
    func position(x: CGFloat, y: CGFloat) -> Chain {
        guard let parent = origin.superview else { return self }
        
        origin.translatesAutoresizingMaskIntoConstraints = false
        origin.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: x).isActive = true
        origin.topAnchor.constraint(equalTo: parent.topAnchor, constant: y).isActive = true
        
        return self
    }
    
    func apply(_ block: (Origin) -> ()) -> Chain {
        block(origin)
        return self
    }
    
}
