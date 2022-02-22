//
//  MVVM_ConclusionViewController.swift
//  TestBed
//
//  Created by sokol on 2022/02/22.
//

import UIKit

class MVVM_ConclusionViewController: UIViewController {
    
    var mainView: DateToggleView!
    var apiInfoView: API_InfoView!
    var apiURLString = "http://worldclockapi.com/api/json/utc/now"
    
    var model: String = ""
    var mainViewModel: String = ""
    var apiInfoViewModel: String = ""
    
    //TODO: ViewModel
    //model for viewcontroller
    //model for mainview
    //model as apiRepository
    init(viewModel: String) {
        self.model = viewModel
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
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: bind and refactor
        fetchData { [weak self] model in
            
            
            
            print("model date is : \(model.currentDateTime)")
        }
        // Do any additional setup after loading the view.
    }
    
    func doSomething() {
        //mainView.doSomething()
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
        
    }
}

extension MVVM_ConclusionViewController {
    func fetchData(_ onCompleted: @escaping (DateResponseModel) -> ()) {
        let url = apiURLString
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(DateResponseModel.self, from: data) else { return }
            onCompleted(model)
        }.resume()
    }
}

