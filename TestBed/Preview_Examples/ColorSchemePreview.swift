//
//  ColorSchemePreview.swift
//  TestBed
//
//  Created by sokol on 2022/02/25.
//

import Foundation
import UIKit
import SwiftUI

#if canImport(SwiftUI) && DEBUG
struct ColorSchemePreviewExample: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            DateToggleView_PreviewTestPreview {
                let view = DateToggleView_PreviewTest(viewModel: "test")
                view.backgroundColor = .tertiaryLabel
                return view
            }.environment(\.colorScheme, colorScheme)
                .previewDisplayName("\(colorScheme)")
        }.previewLayout(.fixed(width: 300, height: 300))
        
    }
}
#endif
