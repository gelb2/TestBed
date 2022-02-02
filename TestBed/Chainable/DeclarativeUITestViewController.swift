//
//  DeclarativeUITestViewController.swift
//  TestBed
//
//  Created by sokol on 2022/01/31.
//

import UIKit

class DeclarativeUITestViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    override func loadView() {
        self.view = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        let red = UIView().chain
            .add(to: self.view)
            .background(color: .red)
            .cornerRadius(8)
            .constraint { m in
                m.edges.equalToSuperview()
                .inset(UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
            }
            .origin

        let green = UIView().chain
            .add(to: red)
            .background(color: .green)
            .cornerRadius(16)
            .constraint {
                $0.edges.equalToSuperview()
                .inset(UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
            }
            .origin

        _ = UIView().chain
            .add(to: green)
            .background(color: .blue)
            .cornerRadius(32)
            .constraint {
                $0.edges.equalToSuperview()
                .inset(UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
            }
        
        _ = UILabel().chain
            .add(to: self.view)
            .text("hello world")
            .background(color: .white)
            .color(.cyan)
            .font(size: 32, weight: .medium)
            .constraint {
                $0.center.equalToSuperview()
            }
    }
    
    
}
