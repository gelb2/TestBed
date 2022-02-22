//
//  API_InfoView.swift
//  TestBed
//
//  Created by sokol on 2022/02/22.
//

import UIKit
import SwiftUI

class API_InfoView: UIView {
    
    private let infoLabel: UILabel = UILabel()
    private var viewModel: String
    
    //TODO: viewModel
    init(viewModel: String) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup() {
        initViewHierachy()
        configureViews()
        bind()
    }
    
}

extension API_InfoView: Presentable {
    func initViewHierachy() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(infoLabel)
        
        var constraints: [NSLayoutConstraint] = []
        defer {
            NSLayoutConstraint.activate(constraints)
        }
        
        constraints += [
            infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            infoLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
            infoLabel.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor),
            infoLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)
        ]
    }
    
    func configureViews() {
        infoLabel.text = "API INFO"
        infoLabel.textColor = .black
        infoLabel.font = fontSet.makeFont(.magdacleanmonoBold)()
        infoLabel.numberOfLines = 0
    }
    
    func bind() {
        infoLabel.text = "API INFO: \(viewModel)"
    }
}

#if canImport(SwiftUI) && DEBUG
struct API_InfoViewPreview<View: UIView>: UIViewRepresentable {

    let view: View
    
    init(_ builder: @escaping() -> View) {
        view = builder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

#endif

#if canImport(SwiftUI) && DEBUG
struct API_InfoViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        API_InfoViewPreview {
            return API_InfoView(viewModel: "test")
        }.previewLayout(.fixed(width: 300, height: 300))
    }
}
#endif
