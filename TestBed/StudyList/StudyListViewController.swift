//
//  StudyListViewController.swift
//  TestBed
//
//  Created by sokol on 2022/02/05.
//

import UIKit

//TODO: adapt Bearfried's VC/UI Protocol handling Logic
//TODO: Make Route/Coordination Logic.
//TODO: adapt MVVM Pattern
//TODO: adapt rxswift, rxcocoa, rxdatasource
class StudyListViewController: UIViewController, StudyListRoutable {
    
    var studyModel: StudyModel
    private var studyViewModel: StudyViewModel
    private var studyListViewModel: StudyListViewModel
    
    private var tableView: UITableView = UITableView()
    
    init(viewModel: StudyModel) {
        self.studyModel = viewModel
        self.studyViewModel = self.studyModel.studyViewModel
        self.studyListViewModel = self.studyModel.studyListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = UIView()
        initViewHierachy()
        configureViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension StudyListViewController: Presentable {
    func initViewHierachy() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        var constraints: [NSLayoutConstraint] = []
        
        constraints += [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func configureViews() {
        //왜인지 모르겠지만 seperatorStyle 을 추가로 설정하니 에러로그가 사라졌다
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.register(StudyListCell.self, forCellReuseIdentifier: "StudyListCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        tableView.prefetchDataSource = nil
        tableView.isPrefetchingEnabled = false
    }
    
    func bind() {
    }
}

extension StudyListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toggleCell(tableView, indexPath: indexPath)
        
        //TODO: make ViewModel Send Scene to route(to: ) method
        let indexPathRow = indexPath.row
        let nextScene = studyListViewModel.lists[indexPathRow].destinationVC
        route(to: nextScene)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        toggleCell(tableView, indexPath: indexPath)
    }
    
    func toggleCell(_ tableView: UITableView, indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? StudyListCell
        let cellViewModel = studyListViewModel.lists[indexPath.row]
        cellViewModel.toggleExpended()
        
        tableView.beginUpdates()
        cell?.toggleDetailView(true)
        tableView.endUpdates()
    }
}

extension StudyListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studyListViewModel.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StudyListCell", for: indexPath) as? StudyListCell else { fatalError("dequeud cell is not StudyListCell") }
        cell.configureData(viewModel: studyListViewModel.lists[indexPath.row])

        return cell
    }
}
