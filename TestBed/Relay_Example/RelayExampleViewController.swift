//
//  RelayExampleViewController.swift
//  TestBed
//
//  Created by sokol on 2022/02/23.
//

import UIKit
import RxSwift
import RxCocoa


enum SortType {
    case none
    case latest
    case oldest
}

enum TermType {
    case none
    case oneMonth
    case threeMonth
    case sixMonth
}

class RelayExampleViewController: UIViewController {
    
    lazy var relayView: RelayExampleView = RelayExampleView()
    
    var sortRelay = BehaviorRelay(value: SortType.none)
    var termRelay = BehaviorRelay(value: TermType.none)
    
    private let disposeBag = DisposeBag()
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = relayView
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

extension RelayExampleViewController: Presentable {
    func initViewHierachy() {
        
    }
    
    func configureViews() {
        
    }
    
    func bind() {
        
        sortRelay.map { $0 == .latest }
            .bind(to: relayView.sortLatestButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        sortRelay.map { $0 == .oldest }
            .bind(to: relayView.sortOldestButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        termRelay.map { $0 == .oneMonth }
            .bind(to: relayView.termOneMonthButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        termRelay.map { $0 == .threeMonth }
            .bind(to: relayView.termThreeMonthButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        termRelay.map { $0 == .sixMonth }
            .bind(to: relayView.termSixMonthButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        relayView.sortLatestButton.rx.tap.map { SortType.latest }
            .bind(to: sortRelay)
            .disposed(by: disposeBag)
        
        relayView.sortOldestButton.rx.tap.map { SortType.oldest }
            .bind(to: sortRelay)
            .disposed(by: disposeBag)
        
        
        relayView.termOneMonthButton.rx.tap.map { TermType.oneMonth }
            .bind(to: termRelay)
            .disposed(by: disposeBag)
        
        relayView.termThreeMonthButton.rx.tap.map { TermType.threeMonth }
            .bind(to: termRelay)
            .disposed(by: disposeBag)
        
        
        relayView.termSixMonthButton.rx.tap.map { TermType.sixMonth }
            .bind(to: termRelay)
            .disposed(by: disposeBag)
        
        
        relayView.confirmButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        relayView.cancelButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
//        Observable
//            .combineLatest(sortRelay.map { $0 != .none }, termRelay.map { $0 != .none })
//            { $0 && $1 }
//            .subscribe(onNext: { [weak self] value in
//                self?.relayView.confirmButton.isEnabled = value
//            })
//            .disposed(by: disposeBag)
        //위 코드는 아래와 효과가 동일하다 내부 로직이나 스레드 여부는 일단 차치하고
        Observable
            .combineLatest(sortRelay.map { $0 != .none }, termRelay.map { $0 != .none })
            { $0 && $1 }
            .bind(to: relayView.confirmButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    
}
