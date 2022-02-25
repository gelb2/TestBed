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

//TODO: research more and upgrade this extension and make it public
fileprivate extension UIView {
    private struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView

        let view: UIView

        func makeUIView(context: Context) -> UIView {
            return view
        }

        func updateUIView(_ uiView: UIView, context: Context) {
        }
    }

    func showPreview() -> some View {
        Preview(view: self).previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}

#endif
