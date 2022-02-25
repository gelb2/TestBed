//
//  DynamicTypeSizePreview.swift
//  TestBed
//
//  Created by sokol on 2022/02/25.
//

import Foundation
import UIKit
import SwiftUI

#if canImport(SwiftUI) && DEBUG
struct DynamicTypeSizePreview: PreviewProvider {
    
    static var previews: some View {
        ForEach(ContentSizeCategory.allCases, id: \.self) { sizeCategory in
            DateToggleView_PreviewTestPreview {
                let view = DateToggleView_PreviewTest(viewModel: "test")
                view.yesterdayButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
                view.yesterdayButton.titleLabel?.adjustsFontForContentSizeCategory = true
                view.todayButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
                view.todayButton.titleLabel?.adjustsFontForContentSizeCategory = true
                view.nextDayButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
                view.nextDayButton.titleLabel?.adjustsFontForContentSizeCategory = true
                return view
            }.environment(\.sizeCategory, sizeCategory)
                .previewLayout(.fixed(width: 300, height: 200))
            .previewDisplayName("\(sizeCategory)")
        }
    }
}

#endif
