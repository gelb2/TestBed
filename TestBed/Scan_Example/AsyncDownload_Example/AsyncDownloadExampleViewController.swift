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
    
    //캐시를 다 날리는 과정이 있어야 할까?
    //NSCache를 쓰는 것이 더 낫지 않을까
    deinit {
        print("asyncVC deinit")
        imageCache.removeAll()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        populateDatasourceFromPlist()
        initViewHierachy()
        configureViews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
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
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
                
        //downloadingImageWithURLSession(indexPath: indexPath)
        //downloadWithGlobalQueue(at: indexPath)
        
        cell.url = urls[indexPath.item]
        
        print("cache data count : \(imageCache.count)")
        
        return cell
    }
}

extension AsyncDownloadExampleViewController {
    // 🎾 글로벌큐를 이용한 다운로드 및 셀 표시
    private func downloadWithGlobalQueue(at indexPath: IndexPath) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self else { return }
            
            let url = self.urls[indexPath.item]
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                if let cell = self.collectionView.cellForItem(at: indexPath) as? PhotoCell {
                    cell.display(image: image)
                }
            }
        }
    }
    
    // 🎾 URL세션을 이용한 다운로드 및 셀 표시
    private func downloadingImageWithURLSession(indexPath: IndexPath) {
        URLSession.shared.dataTask(with: urls[indexPath.item]) { [weak self] data, response, error in
            
            guard let self = self,
                let data = data,
                let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                if let cell = self.collectionView.cellForItem(at: indexPath) as? PhotoCell {
                    cell.display(image: image)
                }
            }
        }.resume()
    }
}

