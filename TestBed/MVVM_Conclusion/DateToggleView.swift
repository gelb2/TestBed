//
//  MVVM_ConclusionView.swift
//  TestBed
//
//  Created by sokol on 2022/02/22.
//

import UIKit
import SwiftUI

class DateToggleView: UIView {
    
    private let dateLabel: UILabel = UILabel()
    private let yesterdayButton: UIButton = UIButton()
    private let todayButton: UIButton = UIButton()
    private let nextDayButton: UIButton = UIButton()
    private var viewModel: String
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //TODO: bind with viewmodel
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

//TODO: init views and configure views
extension DateToggleView: Presentable {
    func initViewHierachy() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        yesterdayButton.translatesAutoresizingMaskIntoConstraints = false
        todayButton.translatesAutoresizingMaskIntoConstraints = false
        nextDayButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(dateLabel)
        self.addSubview(yesterdayButton)
        self.addSubview(todayButton)
        self.addSubview(nextDayButton)
        
        var constraints: [NSLayoutConstraint] = []
        defer {
            NSLayoutConstraint.activate(constraints)
        }
        
        constraints += [
            dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            todayButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            todayButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            yesterdayButton.trailingAnchor.constraint(equalTo: todayButton.leadingAnchor, constant: -20),
            yesterdayButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            nextDayButton.leadingAnchor.constraint(equalTo: todayButton.trailingAnchor,constant: 20),
            nextDayButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20)
        ]
    }
    
    func configureViews() {
        dateLabel.text = "Loading"
        dateLabel.textColor = .black
        dateLabel.font = fontSet.makeFont(.magdacleanmonoBold)()
        
        yesterdayButton.setTitle("yesterday", for: .normal)
        yesterdayButton.setTitleColor(.black, for: .normal)
        yesterdayButton.titleLabel?.font = fontSet.makeFont(.magdacleanmonoRegular)()
        
        todayButton.setTitle("now", for: .normal)
        todayButton.setTitleColor(.black, for: .normal)
        todayButton.titleLabel?.font = fontSet.makeFont(.magdacleanmonoRegular)()
        
        nextDayButton.setTitle("tomorrow", for: .normal)
        nextDayButton.setTitleColor(.black, for: .normal)
        nextDayButton.titleLabel?.font = fontSet.makeFont(.magdacleanmonoRegular)()
    }
    
    func bind() {
        print("DateToggleView : \(viewModel)")
    }
}

#if canImport(SwiftUI) && DEBUG
struct MVVM_ConclusionViewPreview<View: UIView>: UIViewRepresentable {

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
struct MVVM_ConclusionViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        MVVM_ConclusionViewPreview {
            let view = DateToggleView(viewModel: "test")
            return view
        }.previewLayout(.fixed(width: 300, height: 300))
    }
}
#endif
