//
//  ViewControllerPreview.swift
//  TestBed
//
//  Created by sokol on 2022/02/25.
//

import UIKit
import SwiftUI

#if canImport(SwiftUI) && DEBUG

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        DeclarativeUITestViewController().showPreview(.iPhone12Pro)
        DeclarativeUITestViewController().showPreview(.iPhone8)
    }
}
#endif
