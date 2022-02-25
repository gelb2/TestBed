//
//  RelayExampleView.swift
//  TestBed
//
//  Created by sokol on 2022/02/24.
//

import Foundation
import UIKit
import SwiftUI

class RelayExampleView: UIView {
    
    let titleLabel = UILabel()
    let sortTypeLabel = UILabel()
    let sortLatestButton = UIButton(type: .system)
    let sortOldestButton = UIButton(type: .system)
    
    let termTypeLabel = UILabel()
    let termOneMonthButton = UIButton(type: .system)
    let termThreeMonthButton = UIButton(type: .system)
    let termSixMonthButton = UIButton(type: .system)
    
    let cancelButton = UIButton()
    let confirmButton = UIButton(type: .system)
    
    
    //TODO: viewmodel
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

extension RelayExampleView: Presentable {
    func initViewHierachy() {
        let subviews = [titleLabel, sortTypeLabel, sortLatestButton, sortOldestButton, termTypeLabel, termOneMonthButton, termThreeMonthButton, termSixMonthButton, cancelButton, confirmButton]
        
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        let sortTypeButtonLayoutGuide = UILayoutGuide()
        let termTypeButtonLayoutGuide = UILayoutGuide()
        
        self.addLayoutGuide(sortTypeButtonLayoutGuide)
        self.addLayoutGuide(termTypeButtonLayoutGuide)
        
        var constraints: [NSLayoutConstraint] = []
        defer {
            NSLayoutConstraint.activate(constraints)
        }
        constraints += [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            sortTypeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            sortTypeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            sortTypeButtonLayoutGuide.topAnchor.constraint(equalTo: sortTypeLabel.bottomAnchor, constant: 20),
            sortTypeButtonLayoutGuide.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            sortTypeButtonLayoutGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            sortLatestButton.topAnchor.constraint(equalTo: sortTypeButtonLayoutGuide.topAnchor),
            sortLatestButton.leadingAnchor.constraint(equalTo: sortTypeButtonLayoutGuide.leadingAnchor),
            sortLatestButton.trailingAnchor.constraint(equalTo: sortOldestButton.leadingAnchor),
            sortLatestButton.bottomAnchor.constraint(equalTo: sortTypeButtonLayoutGuide.bottomAnchor),
            sortLatestButton.widthAnchor.constraint(equalTo: sortOldestButton.widthAnchor),
            sortOldestButton.topAnchor.constraint(equalTo: sortTypeButtonLayoutGuide.topAnchor),
            sortOldestButton.trailingAnchor.constraint(equalTo: sortTypeButtonLayoutGuide.trailingAnchor),
            sortOldestButton.bottomAnchor.constraint(equalTo: sortTypeButtonLayoutGuide.bottomAnchor),
            termTypeLabel.topAnchor.constraint(equalTo: sortTypeButtonLayoutGuide.bottomAnchor, constant: 20),
            termTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            termTypeButtonLayoutGuide.topAnchor.constraint(equalTo: termTypeLabel.bottomAnchor, constant: 20),
            termTypeButtonLayoutGuide.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            termTypeButtonLayoutGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            termOneMonthButton.topAnchor.constraint(equalTo: termTypeButtonLayoutGuide.topAnchor),
            termOneMonthButton.leadingAnchor.constraint(equalTo: termTypeButtonLayoutGuide.leadingAnchor),
            termOneMonthButton.bottomAnchor.constraint(equalTo: termTypeButtonLayoutGuide.bottomAnchor),
            termOneMonthButton.trailingAnchor.constraint(equalTo: termThreeMonthButton.leadingAnchor),
            termThreeMonthButton.topAnchor.constraint(equalTo: termTypeButtonLayoutGuide.topAnchor),
            termThreeMonthButton.bottomAnchor.constraint(equalTo: termTypeButtonLayoutGuide.bottomAnchor),
            termThreeMonthButton.trailingAnchor.constraint(equalTo: termSixMonthButton.leadingAnchor),
            termSixMonthButton.topAnchor.constraint(equalTo: termTypeButtonLayoutGuide.topAnchor),
            termSixMonthButton.bottomAnchor.constraint(equalTo: termTypeButtonLayoutGuide.bottomAnchor),
            termSixMonthButton.trailingAnchor.constraint(equalTo: termTypeButtonLayoutGuide.trailingAnchor),
            termOneMonthButton.widthAnchor.constraint(equalTo: termThreeMonthButton.widthAnchor),
            termThreeMonthButton.widthAnchor.constraint(equalTo: termSixMonthButton.widthAnchor)
        ]
        
        constraints += [
            cancelButton.topAnchor.constraint(equalTo: termTypeButtonLayoutGuide.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: confirmButton.leadingAnchor),
            confirmButton.topAnchor.constraint(equalTo: termTypeButtonLayoutGuide.bottomAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            cancelButton.widthAnchor.constraint(equalTo: confirmButton.widthAnchor)
        ]
    }
    
    func configureViews() {
        
        self.backgroundColor = .white
        
        titleLabel.text = "내역조회"
        titleLabel.font = fontSet.makeFont(.defaultHeavy)()
        
        sortTypeLabel.text = "정렬기준"
        sortTypeLabel.font = fontSet.makeFont(.defaultMedium)()
        
        sortLatestButton.setTitle("최신순", for: .normal)
        sortLatestButton.setTitleColor(.black, for: .normal)
        sortOldestButton.setTitle("과거순", for: .normal)
        sortOldestButton.setTitleColor(.black, for: .normal)
        
        termTypeLabel.text = "기간설정"
        termTypeLabel.font = fontSet.makeFont(.defaultMedium)()
        
        termOneMonthButton.setTitle("1개월", for: .normal)
        termOneMonthButton.setTitleColor(.black, for: .normal)
        
        termThreeMonthButton.setTitle("3개월", for: .normal)
        termThreeMonthButton.setTitleColor(.black, for: .normal)
        termSixMonthButton.setTitle("6개월", for: .normal)
        termSixMonthButton.setTitleColor(.black, for: .normal)
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.titleLabel?.font = fontSet.makeFont(.magdacleanmonoBold)()
        confirmButton.setTitle("확인", for: .normal)
        confirmButton.setTitleColor(.black, for: .normal)
        confirmButton.titleLabel?.font = fontSet.makeFont(.magdacleanmonoBold)()
        
    }
    
    func bind() {
        
    }
}

#if canImport(SwiftUI) && DEBUG
struct RelayExampleViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
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
struct RelayExampleViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        RelayExampleViewPreview {
            let view = RelayExampleView()
            return view
        }.previewLayout(.fixed(width: 300, height: 300))
    }
}


#endif

