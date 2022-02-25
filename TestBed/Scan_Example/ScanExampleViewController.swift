//
//  ScanExampleViewController.swift
//  TestBed
//
//  Created by sokol on 2022/02/25.
//

import UIKit

class ScanExampleViewController: UIViewController {
    
    lazy var buttonCountView: ButtonCountView = ButtonCountView()
    lazy var textFilerView: TextFilerView = TextFilerView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        initViewHierachy()
        configureViews()
        bind()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ScanExampleViewController: Presentable {
    func initViewHierachy() {
        self.view = UIView()
        
        buttonCountView.translatesAutoresizingMaskIntoConstraints = false
        textFilerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(buttonCountView)
        self.view.addSubview(textFilerView)
        
        var constraints: [NSLayoutConstraint] = []
        defer {
            NSLayoutConstraint.activate(constraints)
        }
        
        constraints += [
            buttonCountView.topAnchor.constraint(equalTo: self.view.topAnchor),
            buttonCountView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            buttonCountView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        
        constraints += [
            textFilerView.topAnchor.constraint(equalTo: buttonCountView.bottomAnchor, constant: 10),
            textFilerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            textFilerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
    }
    
    func configureViews() {
        self.view.backgroundColor = .white
    }
    
    func bind() {
        
    }
    
    
}
