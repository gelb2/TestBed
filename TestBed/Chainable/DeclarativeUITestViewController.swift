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
        self.view.backgroundColor = .yellow
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        _ = UIView().chain
            .add(to: self.view)
            .background(color: .red)
            .cornerRadius(8)
            .position(x: 50, y: 50)
            .size(width: 100, height: 100)
            .position(x: 50, y: 50)

        _ = UIView().chain
            .add(to: self.view)
            .background(color: .green)
            .cornerRadius(16)
            .size(width: 100, height: 100)
            .position(x: 80, y: 80)

        _ = UIView().chain
            .add(to: self.view)
            .background(color: .blue)
            .cornerRadius(24)
            .size(width: 100, height: 100)
            .position(x: 120, y: 120)
        
        _ = UILabel().chain
            .add(to: self.view)
            .position(x: 100, y: 250)
            .text("hello world")
            .background(color: .white)
            .color(.cyan)
            .font(size: 32, weight: .medium)
    }
    
    
}
