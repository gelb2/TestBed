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
        _ = VStackView()
            .add(to: view)
            .spacing(20)
            .constraint {
                $0.top.equalToSuperview().offset(150)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.centerX.equalToSuperview()
            }
            .add(children:
                UIView().chain
                    .add(child:
                        UIView().chain
                            .background(color: .gray)
                            .cornerRadius(50)
                            .constraint {
                                $0.centerX.top.bottom.equalToSuperview()
                                $0.size.equalTo(100)
                            }
                        )
                        .store(to: &profile),
                 
                 Spacer(height: 80),
                 
                 UITextField().chain
                     .apply{ tf in
                         tf.attributedPlaceholder = NSAttributedString(string: "Type Your Email", attributes: [.foregroundColor: UIColor.black])
                         tf.textColor = .red
                     }
                 //TODO: DarkMode Color Set
                     .border(.roundedRect)
                     .keyboardType(.emailAddress)
                     .store(to: &emailField)
                     .constraint{
                         $0.height.equalTo(40)
                     },
                 
                 UITextField().chain
                     .apply{ tf in
                         tf.attributedPlaceholder = NSAttributedString(string: "Type Your Password", attributes: [.foregroundColor: UIColor.yellow])
                         tf.textColor = .green
                     }
                 //TODO: DarkMode Color Set
                     .border(.roundedRect)
                     .secure()
                     .store(to: &passwordField)
                     .constraint{
                         $0.height.equalTo(40)
                     },
                 
                 Spacer(height: 100),
                 
                 UIButton().chain
                     .title("Log in")
                     .title("Fill the info", for: .disabled)
                     .titleColor(.white, for: .normal)
                     .titleColor(.black, for: .disabled)
                     .titleFont(size: 24, weight: .bold)
                     .cornerRadius(12)
                     .background(color: .brown)
                     .store(to: &loginButton)
                     .constraint{
                         $0.height.equalTo(60)
                     }
            )
    }
    
    
    
    
    
}
