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
        initViewHierachy()
        configureViews()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
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
        self.view = relayView
    }
    
    func configureViews() {
        
    }
    
    func bind() {
        sortRelay.flatMap { [weak self] in
            Observable.from([
                ($0 == .latest, self?.relayView.sortLatestButton),
                ($0 == .oldest, self?.relayView.sortOldestButton)
            ])
        }
            .asDriver(onErrorJustReturn: (false, nil))
            .drive(onNext:{ selected, button in
                button?.isSelected = selected
            }).disposed(by: disposeBag)

        
        termRelay.flatMap { [weak self] in
            Observable.from([
                ($0 == .oneMonth, self?.relayView.termOneMonthButton),
                ($0 == .threeMonth, self?.relayView.termThreeMonthButton),
                ($0 == .sixMonth, self?.relayView.termSixMonthButton)
            ])
        }
        .subscribe(onNext: { selected, button in
            button?.isSelected = selected
        })
        .disposed(by: disposeBag)
        
        
        Observable
            .merge(relayView.sortLatestButton.rx.tap.map { SortType.latest },
                   relayView.sortOldestButton.rx.tap.map { SortType.oldest }
            )
            .bind(to: sortRelay)
            .disposed(by: disposeBag)
        
        Observable
            .merge(relayView.termOneMonthButton.rx.tap.map { TermType.oneMonth },
                   relayView.termThreeMonthButton.rx.tap.map { TermType.threeMonth },
                   relayView.termSixMonthButton.rx.tap.map { TermType.sixMonth }
            )
            .bind(to: termRelay)
            .disposed(by: disposeBag)
        
        relayView.confirmButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let alert = UIAlertController(title: "정렬 선택 완료", message: "선택 완료 후 화면을 나갑니다", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default) { action in
                    self?.dismiss(animated: true, completion: nil)
                }
                alert.addAction(okAction)
                self?.present(alert, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        relayView.cancelButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        Observable
            .combineLatest(sortRelay.map { $0 != .none }, termRelay.map { $0 != .none })
            { $0 && $1 }
            .bind(to: relayView.confirmButton.rx.isEnabled)
            .disposed(by: disposeBag)
        //아래 코드는 위와 효과가 동일하다 내부 로직이나 스레드 여부는 일단 차치하고
        //        Observable
        //            .combineLatest(sortRelay.map { $0 != .none }, termRelay.map { $0 != .none })
        //            { $0 && $1 }
        //            .subscribe(onNext: { [weak self] value in
        //                self?.relayView.confirmButton.isEnabled = value
        //            })
        //            .disposed(by: disposeBag)
    }
    
    
}
