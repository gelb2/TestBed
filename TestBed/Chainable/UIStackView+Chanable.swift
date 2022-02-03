//
//  UIStackView+Chanable.swift
//  TestBed
//
//  Created by sokol on 2022/02/03.
//

import UIKit

extension Chain where Origin: UIStackView {
    func axis(_ axis: NSLayoutConstraint.Axis) -> Chain {
        origin.axis = axis
        return self
    }
    
    func spacing(_ spacing: CGFloat) -> Chain {
        origin.spacing = spacing
        return self
    }
    
    func alignment(_ alignment: UIStackView.Alignment) -> Chain {
        origin.alignment = alignment
        return self
    }
    
    func distribution(_ distribution: UIStackView.Distribution) -> Chain {
        origin.distribution = distribution
        return self
    }
}

func HStackView() -> Chain<UIStackView> {
    return UIStackView().chain.axis(.horizontal)
}

func VStackView() -> Chain<UIStackView> {
    return UIStackView().chain.axis(.vertical)
}
