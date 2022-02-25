//
//  ScanExampleViewController.swift
//  TestBed
//
//  Created by sokol on 2022/02/25.
//

import UIKit

class ScanExampleViewController: UIViewController {
    
    lazy var buttonCountView: ButtonCountView = ButtonCountView()
    
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
        
        self.view.addSubview(buttonCountView)
        
        var constraints: [NSLayoutConstraint] = []
        defer {
            NSLayoutConstraint.activate(constraints)
        }
        
        constraints += [
            buttonCountView.topAnchor.constraint(equalTo: self.view.topAnchor),
            buttonCountView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            buttonCountView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            buttonCountView.heightAnchor.constraint(equalToConstant: 300)
        ]
    }
    
    func configureViews() {
        self.view.backgroundColor = .white
    }
    
    func bind() {
        
    }
    
    
}
