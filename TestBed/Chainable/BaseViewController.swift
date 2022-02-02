//
//  BaseViewController.swift
//  TestBed
//
//  Created by sokol on 2022/02/02.
//

import UIKit
import RxSwift
import RxCocoa

@objc protocol BaseViewControllerCustomizable {
    @objc optional func setupViews()
    @objc optional func setupBindings()
}

class BaseViewController: UIViewController, BaseViewControllerCustomizable {
    
    var disposeBag = DisposeBag()
    
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
        _setupViews()
        _setupBindings()
    }
    
    private func _setupViews() {
        self.view.backgroundColor = .white
        self.view.translatesAutoresizingMaskIntoConstraints = false
        (self as BaseViewControllerCustomizable).setupViews?()
    }
    
    private func _setupBindings() {
        let tapper = UITapGestureRecognizer()
        view.addGestureRecognizer(tapper)
        
        tapper.rx.event.asDriver().drive(onNext: { [weak self] event in
            self?.view.endEditing(true)
        }).disposed(by: disposeBag)
        
        (self as BaseViewControllerCustomizable).setupBindings?()
    }
}
