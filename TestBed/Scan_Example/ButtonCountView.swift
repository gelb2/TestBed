//
//  ScanExampleView.swift
//  TestBed
//
//  Created by sokol on 2022/02/25.
//

import UIKit
import SwiftUI
import RxSwift
import RxCocoa

class ButtonCountView: UIView {
    
    private let disposeBag = DisposeBag()
    
    var tapCountButton = UIButton(type: .system)

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    init() {
        super.init(frame: .zero)
        initViewHierachy()
        configureViews()
        bind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension ButtonCountView: Presentable {
    func initViewHierachy() {
        tapCountButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tapCountButton)
        
        var constraints: [NSLayoutConstraint] = []
        defer {
            NSLayoutConstraint.activate(constraints)
        }
        
        let tapCountButtonLayout = UILayoutGuide()
        self.addLayoutGuide(tapCountButtonLayout)
        
        constraints += [
            tapCountButtonLayout.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            tapCountButtonLayout.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tapCountButtonLayout.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tapCountButtonLayout.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ]
        
        constraints += [
            tapCountButton.topAnchor.constraint(equalTo: tapCountButtonLayout.topAnchor),
            tapCountButton.leadingAnchor.constraint(equalTo: tapCountButtonLayout.leadingAnchor),
            tapCountButton.trailingAnchor.constraint(equalTo: tapCountButtonLayout.trailingAnchor),
            tapCountButton.bottomAnchor.constraint(equalTo: tapCountButtonLayout.bottomAnchor)
        ]
    }
    
    func configureViews() {
        self.backgroundColor = .cyan
        
        tapCountButton.setTitle("count", for: .normal)
        tapCountButton.setTitleColor(.black, for: .normal)
    }
    
    func bind() {
        tapCountButton.rx.tap
            .scan(0) { lastCount, newValue in
                return lastCount + 1
            }
            .subscribe(onNext: {
                print("tapped Count is \($0)")
            })
            .disposed(by: disposeBag)
    }
}

#if canImport(SwiftUI) && DEBUG
struct ButtonCountViewPreview<View: UIView>: UIViewRepresentable {
    var view: View
    
    init(_ builder: @escaping () -> View) {
        self.view = builder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

#endif

#if canImport(SwiftUI) && DEBUG
struct ButtonCountViewPreviewProvider: PreviewProvider {
    
    static let buttonCountView = ButtonCountView()
    
    static var previews: some View {
        ButtonCountViewPreview {
            buttonCountView
        }.previewLayout(.fixed(width: 300, height: 100))
    }
}

#endif
