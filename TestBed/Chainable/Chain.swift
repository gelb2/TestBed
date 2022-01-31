//
//  Chain.swift
//  TestBed
//
//  Created by sokol on 2022/01/31.
//

import Foundation

class Chain<Origin> {
    var origin: Origin
    
    init(origin: Origin) {
        self.origin = origin
    }
}

protocol Chainable {}

extension Chainable {
    var chain: Chain<Self> {
        return Chain(origin: self)
    }
}
