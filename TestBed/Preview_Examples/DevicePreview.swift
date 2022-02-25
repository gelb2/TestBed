//
//  DevicePreview.swift
//  TestBed
//
//  Created by sokol on 2022/02/25.
//

import Foundation

import UIKit
import SwiftUI

//프리뷰 프로바이더 인스턴스를 2개 만들 수도 있다
#if canImport(SwiftUI) && DEBUG
struct DevicePreviewExample: PreviewProvider {
    static var previews: some View {
        DateToggleView_PreviewTestPreview {
            let view = DateToggleView_PreviewTest(viewModel: "test")
            return view
        }.previewDevice("iPhone 8")
    }
}
#endif

//프리뷰 프로바이더 인스턴스를 2개 만들 수도 있다
#if canImport(SwiftUI) && DEBUG
struct DevicePreviewWithExtensionExample: PreviewProvider {
    static var previews: some View {
        return DateToggleView_PreviewTest(viewModel: "test").showPreview()
    }
}
#endif

