//
//  PhotoCell.swift
//  TestBed
//
//  Created by sokol on 2022/08/16.
//
//인프런GCD강좌
import UIKit

final class PhotoCell: UICollectionViewCell {
    
    let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()
    
    func display(image: UIImage?) {
          mainImageView.image = image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(mainImageView)
        self.contentView.addSubview(activityIndicator)
        
        //왜 강사는 contentView.addSubview가 아니라 그냥 addsubView를 했지?
//        addSubview(mainImageView)
//        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
