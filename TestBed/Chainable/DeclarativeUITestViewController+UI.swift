//
//  DeclarativeUITestViewController+UI.swift
//  TestBed
//
//  Created by sokol on 2022/02/02.
//

import UIKit

extension DeclarativeUITestViewController {
    func setupViews() {
        let profile = UIView().chain
            .add(to: view)
            .background(color: .gray)
            .cornerRadius(50)
            .constraint { m in
                m.top.equalToSuperview().offset(150)
                m.centerX.equalToSuperview()
                m.size.equalTo(100)
            }
            .origin
        
        let emailField = UITextField().chain
            .add(to: view)
            .constraint {
                $0.top.equalTo(profile.snp.bottom).offset(50)
                $0.leading.equalToSuperview()
                $0.trailing.equalToSuperview()
                $0.height.equalTo(40)
            }
        
        
    }
}
