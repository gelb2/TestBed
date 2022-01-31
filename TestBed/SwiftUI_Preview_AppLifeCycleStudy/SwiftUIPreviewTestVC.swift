//
//  ViewController.swift
//  TestBed
//
//  Created by sokol on 2021/12/12.
//

import UIKit

class SwiftUIPreviewTestVC: UIViewController {
    lazy var mainView = BlueView()

    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func update(buttonName name: String) {
        mainView.set(state: .init(buttonName: name))
    }


}

