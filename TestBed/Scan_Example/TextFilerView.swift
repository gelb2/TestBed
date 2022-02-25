//
//  TextFilerView.swift
//  TestBed
//
//  Created by sokol on 2022/02/25.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftUI

class TextFilerView: UIView {
    
    private let disposeBag = DisposeBag()
    
    lazy var numberOnlyTextField = UITextField()

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

extension TextFilerView: Presentable {
    func initViewHierachy() {
        
        numberOnlyTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(numberOnlyTextField)
        
        var constraints: [NSLayoutConstraint] = []
        defer {
            NSLayoutConstraint.activate(constraints)
        }
        
        let layoutGuide = UILayoutGuide()
        self.addLayoutGuide(layoutGuide)
        
        constraints += [
            layoutGuide.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            layoutGuide.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            layoutGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            layoutGuide.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ]
        
        constraints += [
            numberOnlyTextField.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            numberOnlyTextField.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            numberOnlyTextField.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            numberOnlyTextField.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
        ]
    }
    
    func configureViews() {
        self.backgroundColor = .yellow
        
        numberOnlyTextField.placeholder = "Type Text Here"
        numberOnlyTextField.layer.borderWidth = 1.0
    }
    
    func bind() {
        numberOnlyTextField.rx.text.orEmpty.asObservable()
            .scan("", accumulator: { oldValue, newValue in
                return newValue.isNumber ? newValue : oldValue
            })
            .bind(to: numberOnlyTextField.rx.text)
            .disposed(by: disposeBag)
    }
    
    
}

fileprivate extension String {
   var isNumber: Bool {
   do {
      let regex = try NSRegularExpression(pattern: "^[0-9]+$", options: .caseInsensitive)
      if let _ = regex.firstMatch(in: self, options: .reportCompletion, range: NSMakeRange(0, count)) { return true }
      } catch { return false }
      return false
   }
}

#if canImport(SwiftUI) && DEBUG
struct TextFilerViewPreview<View: UIView>: UIViewRepresentable {
    var view: View
    
    init(_ builder: @escaping () -> View) {
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
struct TextFilerViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        TextFilerViewPreview {
            TextFilerView()
        }.previewLayout(.fixed(width: 300, height: 100))
    }
}

#endif
