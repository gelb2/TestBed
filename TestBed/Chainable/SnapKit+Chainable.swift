//
//  SnapKit+Chainable.swift
//  TestBed
//
//  Created by sokol on 2022/02/02.
//

import UIKit
import SnapKit

extension Chain where Origin: UIView {
    func constraint(_ maker: (ConstraintMaker) -> Void) -> Chain {
        origin.snp.makeConstraints(maker)
        return self
    }
    
    func updateConstraint(_ maker: (ConstraintMaker) -> Void) -> Chain {
        origin.snp.updateConstraints(maker)
        return self
    }
}
