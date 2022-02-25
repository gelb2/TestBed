//
//  UIView+Extension.swift
//  TestBed
//
//  Created by sokol on 2022/02/25.
//

import UIKit
import SwiftUI

#if canImport(SwiftUI) && DEBUG
//TODO: research more and upgrade this extension and make it public
extension UIView {
    private struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView

        let view: UIView

        func makeUIView(context: Context) -> UIView {
            return view
        }

        func updateUIView(_ uiView: UIView, context: Context) {
        }
    }

    func showPreview(_ deviceType: PreviewDeviceType = .iPhone12Pro) -> some View {
        Preview(view: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}

#endif

