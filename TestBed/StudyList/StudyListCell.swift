//
//  StudyListCell.swift
//  TestBed
//
//  Created by sokol on 2022/02/05.
//

import UIKit
import SwiftUI
//TODO: Presentable Protocol?
//TODO: adapt Declartive UI Logic
//TODO: Remove UI Refresh Bug with tableView.PerformBatchUpdate and ViewModel Refactor

protocol CellConfigurable {
    func configureData(viewModel: StudyCellViewModel)
}

class StudyListCell: UITableViewCell {
    
    var titleLabel: UILabel = UILabel()
    var descriptionLabel: UILabel = UILabel()
    var divider: UIView = UIView()
    var detailView: UIView = UIView()
    var detailViewHeightConstraint: NSLayoutConstraint!
    
    var viewModel: StudyCellViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViewHierachy()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func initViewHierachy() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(divider)
        self.contentView.addSubview(detailView)
        
        var constraints: [NSLayoutConstraint] = []
        
        let layoutGuide = UILayoutGuide()
        contentView.addLayoutGuide(layoutGuide)
        
        detailViewHeightConstraint = detailView.heightAnchor.constraint(equalToConstant: 0)
        detailViewHeightConstraint.priority = UILayoutPriority(rawValue: 950)
        
        constraints += [
            layoutGuide.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 4),
            layoutGuide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            layoutGuide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            layoutGuide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 64),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 48),
            descriptionLabel.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -12),
            divider.heightAnchor.constraint(equalToConstant: 2),
            divider.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 2),
            divider.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -2),
            divider.bottomAnchor.constraint(equalTo: detailView.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            detailViewHeightConstraint
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureViews() {
        self.contentView.backgroundColor = .yellow
        
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
        titleLabel.numberOfLines = 1
        
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        descriptionLabel.numberOfLines = 0
        
        divider.backgroundColor = .orange
        
        detailView.backgroundColor = .red
    }
    
    override func prepareForReuse() {
        toggleDetailView(false)
    }

    func toggleDetailView(_ shouldPerformAnimate: Bool = false) {
        if self.viewModel.isExpended == true {
            self.detailViewHeightConstraint.constant = 100
            self.descriptionLabel.textColor = .red
            self.detailView.isHidden = false
        } else if self.viewModel.isExpended == false {
            self.detailViewHeightConstraint.constant = 0
            self.descriptionLabel.textColor = .blue
            
            if shouldPerformAnimate == false {
                self.detailView.isHidden = true
            } else if shouldPerformAnimate == true {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25 , execute: {
                    self.detailView.isHidden = true
                })
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension StudyListCell: CellConfigurable {
    func configureData(viewModel: StudyCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = self.viewModel.title
        descriptionLabel.text = self.viewModel.description
        toggleDetailView(false)
    }
}
