//
//  ViewControllerPreview.swift
//  TestBed
//
//  Created by sokol on 2022/02/25.
//

import UIKit
import SwiftUI

//TODO: Research more and make it public
enum PreviewDeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone12Pro
    case iPhone12ProMax

    func name() -> String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone12Pro:
            return "iPhone 12 Pro"
        case .iPhone12ProMax:
            return "iPhone 12 Pro Max"
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func showPreview(_ deviceType: PreviewDeviceType = .iPhone12Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}
#endif

#if canImport(SwiftUI) && DEBUG

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        DeclarativeUITestViewController().showPreview(.iPhone12Pro)
        DeclarativeUITestViewController().showPreview(.iPhone8)
    }
}
#endif
