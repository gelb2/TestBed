//
//  PhotoCell+NSCache.swift
//  TestBed
//
//  Created by sokol on 2022/08/16.
//

import UIKit

final class PhotoCell_NSCache: UICollectionViewCell {
    
    var url: URL? {
        didSet {
            guard let url = url?.absoluteString else { return }
            mainImageView.isLoading = true
            mainImageView.loadImage(urlString: url)
        }
    }
    
    let mainImageView: CacheImageView_NSCache = {
        let iv = CacheImageView_NSCache()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    func display(image: UIImage?) {
          mainImageView.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(mainImageView)
        //왜 강사는 contentView.addSubview가 아니라 그냥 addsubView를 했지?
//        addSubview(mainImageView)
//        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

