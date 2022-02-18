//
//  BlueView.swift
//  TestBed
//
//  Created by sokol on 2021/12/12.
//

import UIKit

final class BlueView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    struct State {
        var buttonName: String
    }
    
    lazy var button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .systemBlue
        
        button.setTitle("RealButton", for: .normal)
        button.sizeToFit()
        button.backgroundColor = .systemRed
        
        //프레임이 아니라 오토레이아웃을 잡아도 정상동작은 되는 것으로 보인다.....?
//        button.frame.origin.x = 100
//        button.frame.origin.y = 100
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 50).isActive = true
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -40).isActive = true
    }
    
    func set(state: State) {
        button.setTitle(state.buttonName, for: .normal)
        button.sizeToFit()
    }

}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    // MARK: UIViewRepresentable
    
    func makeUIView(context: Context) -> UIView { view }
    
    func updateUIView(_ uiView: UIView, context: Context) { }
}

#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct BlueViewPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            UIViewPreview { BlueView() }
            UIViewPreview {
                let view = BlueView()
                view.set(state: .init(buttonName: "Hello World"))
                return view
            }
        }.previewLayout(.fixed(width: 200, height: 200))
    }
}

#endif
