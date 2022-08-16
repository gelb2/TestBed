//
//  AsyncDownloadExampleViewController.swift
//  TestBed
//
//  Created by sokol on 2022/08/16.
//

//인프런GCD강좌
import UIKit

class AsyncDownloadExampleViewController: UIViewController {
    
    private let layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    private let reuseIdentifier = "PhotoCell"
    private let cellSpacing: CGFloat = 1
    private let columns: CGFloat = 3
    private var urls: [URL] = []
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        populateDatasourceFromPlist()
        initViewHierachy()
        configureViews()
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func populateDatasourceFromPlist() {
        // Photos.plist에서 뽑아내서, urls에 저장하기
        // Target Membership설정
        guard let url = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
            let contents = try? Data(contentsOf: url),
            let serial = try? PropertyListSerialization.propertyList(from: contents, format: nil),
            let serialUrls = serial as? [String]
            else { return print("무엇인가 잘못되었습니다...") }
        
        urls = serialUrls.compactMap { URL(string: $0) }
    }

}

extension AsyncDownloadExampleViewController: Presentable {
    func initViewHierachy() {
        self.view = UIView()
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    func configureViews() {
        self.view.backgroundColor = .white
        collectionView.backgroundColor = .white
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        let width = (UIScreen.main.bounds.width - cellSpacing * 2) / columns
        layout.itemSize = CGSize(width: width , height: width)
    }
    
    func bind() {
        collectionView.dataSource = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    
}

extension AsyncDownloadExampleViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        // 🎾 cellForItemAt에서 처리하면 동시성처리가 안되고 있는 것임
        if let data = try? Data(contentsOf: urls[indexPath.item]),
          let image = UIImage(data: data) {
          cell.display(image: image)
        } else {
          cell.display(image: nil)
        }
        
        return cell
    }
    
        
    
}

