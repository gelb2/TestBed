//
//  FontEnum.swift
//  TestBed
//
//  Created by sokol on 2022/02/22.
//

import Foundation
import UIKit
//TODO: Refactor Font Enum
enum fontSet {
    case magdacleanmonoBold
    case magdacleanmonoRegular
    case defaultFont
    
    func makeFont() -> UIFont {
        switch self {
        case .magdacleanmonoBold:
            return UIFont(name: "magdacleanmono-bold", size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .heavy)
        case .magdacleanmonoRegular:
            return UIFont(name: "magdacleanmono-regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium)
        case .defaultFont:
            return UIFont.systemFont(ofSize: 14)
        }
    }
}
