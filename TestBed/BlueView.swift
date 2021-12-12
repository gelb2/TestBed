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
        
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.sizeToFit()
        button.backgroundColor = .systemRed
        button.frame.origin.x = 100
        button.frame.origin.y = 100
        
        addSubview(button)
    }

}
