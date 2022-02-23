//
//  RelayExampleViewController.swift
//  TestBed
//
//  Created by sokol on 2022/02/23.
//

import UIKit
import RxSwift
import RxCocoa

class RelayExampleViewController: UIViewController {
    
    lazy var relayView: RelayExampleView = RelayExampleView()
    
    enum SortType {
        case none, newest, oldest
    }
    
    enum MonthType {
        case none, one, three, six
    }
    
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
        
    }
    
    
}
