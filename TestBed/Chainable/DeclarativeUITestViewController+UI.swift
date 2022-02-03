//
//  DeclarativeUITestViewController+UI.swift
//  TestBed
//
//  Created by sokol on 2022/02/02.
//

import UIKit

extension DeclarativeUITestViewController {
    
    func setupViews() {
        //TODO: Upgrate VStackView API Wrap
        let stack = VStackView()
            .add(to: view)
            .spacing(10)
            .constraint {
                $0.top.equalToSuperview().offset(150)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.centerX.equalToSuperview()
            }
        
        let wrap = UIView().chain
            .add(to: stack)
        
        self.profile = UIView().chain
            .add(to: wrap)
            .background(color: .gray)
            .cornerRadius(50)
            .constraint {
                $0.centerX.top.bottom.equalToSuperview()
                $0.size.equalTo(100)
            }
            .origin
        
        self.emailField = UITextField().chain
            .add(to: stack)
            .apply{ tf in
                tf.attributedPlaceholder = NSAttributedString(string: "Type Your Email", attributes: [.foregroundColor: UIColor.black])
                tf.textColor = .red
            }
        //TODO: DarkMode Color Set
            .border(.roundedRect)
            .keyboardType(.emailAddress)
            .constraint{
                $0.height.equalTo(40)
            }
            .origin
        
        self.passwordField = UITextField().chain
            .add(to: stack)
            .apply{ tf in
                tf.attributedPlaceholder = NSAttributedString(string: "Type Your Password", attributes: [.foregroundColor: UIColor.yellow])
                tf.textColor = .green
            }
        //TODO: DarkMode Color Set
            .border(.roundedRect)
            .secure()
            .constraint{
                $0.height.equalTo(40)
            }
            .origin
        
        self.loginButton = UIButton().chain
            .add(to: stack)
            .title("Log in")
            .title("Fill the info", for: .disabled)
            .titleColor(.white, for: .normal)
            .titleColor(.black, for: .disabled)
            .titleFont(size: 24, weight: .bold)
            .cornerRadius(12)
            .background(color: .brown)
            .constraint{
                $0.height.equalTo(60)
            }
            .origin
    }
    
    
    
    
    
}
