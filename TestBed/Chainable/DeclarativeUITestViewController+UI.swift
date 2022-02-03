//
//  DeclarativeUITestViewController+UI.swift
//  TestBed
//
//  Created by sokol on 2022/02/02.
//

import UIKit

extension DeclarativeUITestViewController {
    func setupViews() {
        self.profile = UIView().chain
            .add(to: view)
            .background(color: .gray)
            .cornerRadius(50)
            .constraint { m in
                m.top.equalToSuperview().offset(150)
                m.centerX.equalToSuperview()
                m.size.equalTo(100)
            }
            .origin
        
        self.emailField = UITextField().chain
            .add(to: view)
            .apply{ tf in
                tf.attributedPlaceholder = NSAttributedString(string: "Type Your Email", attributes: [.foregroundColor: UIColor.black])
                tf.textColor = .red
            }
        //TODO: DarkMode Color Set
            .border(.roundedRect)
            .keyboardType(.emailAddress)
            .constraint {
                $0.top.equalTo(profile.snp.bottom).offset(50)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.height.equalTo(40)
            }.origin
        
        self.passwordField = UITextField().chain
            .add(to: view)
            .apply{ tf in
                tf.attributedPlaceholder = NSAttributedString(string: "Type Your Password", attributes: [.foregroundColor: UIColor.yellow])
                tf.textColor = .green
            }
        //TODO: DarkMode Color Set
            .border(.roundedRect)
            .secure()
            .constraint {
                $0.top.equalTo(emailField.snp.bottom).offset(20)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.height.equalTo(40)
            }.origin
        
        self.loginButton = UIButton().chain
            .add(to: view)
            .title("Log in")
            .title("Fill the info", for: .disabled)
            .titleColor(.white, for: .normal)
            .titleColor(.black, for: .disabled)
            .titleFont(size: 24, weight: .bold)
            .cornerRadius(12)
            .background(color: .brown)
            
            .constraint {
                $0.top.equalTo(passwordField.snp.bottom).offset(32)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.height.equalTo(80)
            }.origin
        
        
    }
}
