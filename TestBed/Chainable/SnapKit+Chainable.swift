//
//  SnapKit+Chainable.swift
//  TestBed
//
//  Created by sokol on 2022/02/02.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIView {
    var didMoveToSuperView: ControlEvent<Void> {
        let event = methodInvoked(#selector(Base.didMoveToSuperview)).map{ _ in }
        return ControlEvent(events: event)
    }
}

extension Chain where Origin: UIView {
    func constraint(_ maker: @escaping (ConstraintMaker) -> Void) -> Chain {
        
        if let _ = origin.superview {
            origin.snp.makeConstraints(maker)
        } else {
            _ = origin.rx.didMoveToSuperView
                .take(1)
                .subscribe(onNext: {  _ in
                self.origin.snp.makeConstraints(maker)
            })
        }
        
        return self
    }
    
    func updateConstraint(_ maker: @escaping (ConstraintMaker) -> Void) -> Chain {
        
        if let _ = origin.superview {
            origin.snp.updateConstraints(maker)
        }
        return self
    }
}
