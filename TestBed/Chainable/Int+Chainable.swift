//
//  Int+Chainable.swift
//  TestBed
//
//  Created by sokol on 2022/01/31.
//

import Foundation

extension Int: Chainable { }

extension Chain where Origin == Int {
    func increase() -> Chain {
        origin += 1
        return self
    }
    func decrease() -> Chain {
        origin += 1
        return self
    }
}
