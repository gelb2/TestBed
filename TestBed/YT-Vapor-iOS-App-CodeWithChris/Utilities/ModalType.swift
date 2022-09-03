//
//  ModalType.swift
//  TestBed
//
//  Created by pablo.jee on 2022/09/02.
//

import Foundation

enum ModalType: Identifiable {
    var id: String {
        switch self {
        case .add: return "add"
        case .update: return "update"
        }
    }
    
    case add
    case update(Song)
}
