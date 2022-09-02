//
//  CacheImageView+NSCache.swift
//  TestBed
//
//  Created by sokol on 2022/08/16.
//

import UIKit

class CacheImageView_NSCache: UIImageView {

    var sharedCache = NSCache<AnyObject, AnyObject>.sharedCache
    // 액티비티인디케이터 설정
    var isLoading: Bool {
      get { return activityIndicator.isAnimating }
      set {
        if newValue {
          activityIndicator.startAnimating()
        } else {
          activityIndicator.stopAnimating()
        }
      }
    }
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        self.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        return indicator
    }()
    
    var lastImgUrlUsedToLoadImage: String?
    
    func loadImage(urlString: String) {
        
        self.image = nil
        lastImgUrlUsedToLoadImage = urlString
        
        //이미지가 캐시에 있는지 먼저 확인
        if let image = sharedCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = image
            self.isLoading = false
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self else { return }
            
            if let error = error {
                print("Failed to load image with error", error.localizedDescription)
            }
            
            //ViewController의 cellForItem 에서 주입받은 URLString이
            //URLSession 리퀘스트에 활용된 URLString과 동일한지 검증
            //URLString의 주입은 cellForItem 함수가 호출될 때마다 적시에 이뤄질 것이나
            //URLSession의 리퀘스트는 비동기로 돌아간다. 콜백이 언제 날아올지, URLString의 주입 순서에 맞게 콜백이 날아올지도 미지수이다.
            //그러므로 리퀘스트의 콜백으로 받은 이미지가 cellForItem에서 주입받은 URLString과 짝이 맞는 이미지인지를 검증할 필요가 있다.
            if self.lastImgUrlUsedToLoadImage != url.absoluteString {
                return
            }
            
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            
            //이미지 캐시 저장
            self.sharedCache.setObject(image, forKey: url.absoluteString as NSString)
            
            DispatchQueue.main.async {
                self.image = image
                self.isLoading = false
            }
        }.resume()
        
    }
}

