//
//  DeclarativeUITestViewController.swift
//  TestBed
//
//  Created by sokol on 2022/01/31.
//

import UIKit
import RxSwift
import RxCocoa

class DeclarativeUITestViewController: BaseViewController {
    
    var profile: UIView!
    var emailField: UITextField!
    var passwordField: UITextField!
    var loginButton: UIButton!
    
    func setupBindings() {
        //TODO: try refactor with debounce?
        //TODO: try refactoring with driver and button bind
        Observable.combineLatest(
            emailField.rx.text.orEmpty.map { $0.isEmpty },
            passwordField.rx.text.orEmpty.map { $0.isEmpty })
            { $0 || $1 }
            .map { !$0}
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        //TODO: Handle option control event rxoperator
        loginButton.rx.tap.asObservable()
            .withLatestFrom(Observable.zip(emailField.rx.text, passwordField.rx.text) {
                ($0, $1) })
            .filter { (email, pw) in email != nil && pw != nil }
            .map { (email, pw) in (email!, pw!) }
            .subscribe(onNext: { [weak self] (email, pw) in
                self?.login(email: email, password: pw)
            })
            .disposed(by: disposeBag)
    }
    
    func login(email: String, password: String) {
        print("email : \(email), password: \(password)")
    }
}
