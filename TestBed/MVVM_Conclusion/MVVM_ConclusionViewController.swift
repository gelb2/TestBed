//
//  MVVM_ConclusionViewController.swift
//  TestBed
//
//  Created by sokol on 2022/02/22.
//

import UIKit
import RxSwift
//TODO: vm, service, repository가 deinit이 되지 않는 듯한 이슈가 보이는데 나중에 수정...
class MVVM_ConclusionViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    var mainView: DateToggleView!
    var apiInfoView: API_InfoView!
    var apiURLString = "http://worldclockapi.com/api/json/utc/now"
    
    var viewModel: ViewModel
    var mainViewModel: String = ""
    var apiInfoViewModel: String = ""
    
    //TODO: ViewModel
    //model for viewcontroller
    //model for mainview
    //model as apiRepository
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.mainViewModel = apiURLString
        self.apiInfoViewModel = apiURLString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //TODO: make view class and set to self.view
    override func loadView() {
        self.view = UIView()
        initViewHierachy()
        configureViews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.reload()
        
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

extension MVVM_ConclusionViewController: Presentable {
    func initViewHierachy() {
        mainView = DateToggleView(viewModel: mainViewModel)
        apiInfoView = API_InfoView(viewModel: apiInfoViewModel)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        apiInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(mainView)
        self.view.addSubview(apiInfoView)
        
        var constraints: [NSLayoutConstraint] = []
        defer {
            NSLayoutConstraint.activate(constraints)
        }
        
        constraints += [
            mainView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            apiInfoView.topAnchor.constraint(equalTo: mainView.bottomAnchor),
            apiInfoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            apiInfoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            apiInfoView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mainView.heightAnchor.constraint(equalTo: apiInfoView.heightAnchor)
        ]
    }
    
    func configureViews() {
        mainView.backgroundColor = .green
        apiInfoView.backgroundColor = .white
    }
    
    func bind() {

        viewModel.dateTimeString.observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] dateString in
                self?.mainView.dateStringChanged(dateString)
            })
            .disposed(by: disposeBag)
        
        viewModel.isDaylightBlaBla.asDriver()
            .drive(onNext: { [weak self] boolValue in
                self?.apiInfoView.onCalled(boolValue , self?.viewModel.apiCallCount ?? 0)
            })
            .disposed(by: disposeBag)
        
        mainView.today = { [weak self] in
            self?.viewModel.reload()
        }
        
        mainView.yesterday = { [weak self] in
            self?.viewModel.moveDay(day: -1)
        }
        
        mainView.tomorrow = { [weak self] in
            self?.viewModel.moveDay(day: +1)
        }
    }
}


