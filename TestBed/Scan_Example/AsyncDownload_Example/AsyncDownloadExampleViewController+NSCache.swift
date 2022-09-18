//
//  AsyncDownloadingViewController+NSCache.swift
//  TestBed
//
//  Created by sokol on 2022/08/16.
//

//인프런GCD강좌
import UIKit

class AsyncDownloadExampleViewController_NSCache: UIViewController {
    
    private let layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    private let reuseIdentifier = "PhotoCell+NSCache"
    private let cellSpacing: CGFloat = 1
    private let columns: CGFloat = 3
    private var urls: [URL] = []
    
    var sharedCache = NSCache<AnyObject, AnyObject>.sharedCache
    private let utilityQueue = DispatchQueue.global(qos: .utility)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    //캐시를 다 날리는 과정이 있어야 할까?
    deinit {
        print("asyncVC deinit")
        purgeCache()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        settingCache()
        populateDatasourceFromPlist()
        initViewHierachy()
        configureViews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func settingCache() {
        sharedCache.countLimit = 0  //unlimited. default
        sharedCache.totalCostLimit = 0 //unlimited. default
        //sharedCache.totalCostLimit = 50 * 1024 * 1024 //50mb
    }
    
    private func purgeCache() {
        sharedCache.removeAllObjects()
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

extension AsyncDownloadExampleViewController_NSCache: Presentable {
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
        collectionView.delegate = self
        collectionView.register(PhotoCell_NSCache.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    
}

extension AsyncDownloadExampleViewController_NSCache: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell+NSCache", for: indexPath) as! PhotoCell_NSCache
        //downloadingImageWithURLSession(indexPath: indexPath)
        //downloadWithGlobalQueue(at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let key = urls[indexPath.item].absoluteString
        if let image = sharedCache.object(forKey: key as NSString ) as? UIImage {
            (cell as? PhotoCell_NSCache)?.display(image: image)
        } else {
            downloadWithGlobalQueue(at: indexPath)
        }
    }
    
}

extension AsyncDownloadExampleViewController_NSCache {
    // 🎾 글로벌큐를 이용한 다운로드 및 셀 표시
    private func downloadWithGlobalQueue(at indexPath: IndexPath) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self else { return }
            
            let url = self.urls[indexPath.item]
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else { return }
            self.sharedCache.setObject(image, forKey: url.absoluteString as NSString)
            DispatchQueue.main.async {
                if let cell = self.collectionView.cellForItem(at: indexPath) as? PhotoCell_NSCache {
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
                if let cell = self.collectionView.cellForItem(at: indexPath) as? PhotoCell_NSCache {
                    cell.display(image: image)
                }
            }
        }.resume()
    }
}


