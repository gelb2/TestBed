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

extension StudyListCell: Presentable {
    func initViewHierachy() {

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
    
    func configureViews() {
        self.contentView.backgroundColor = .yellow
        
        titleLabel.textColor = .black
        titleLabel.font = fontSet.makeFont(.magdacleanmonoBold)()
        titleLabel.numberOfLines = 1
        
        descriptionLabel.textColor = .black
        descriptionLabel.font = fontSet.makeFont(.magdacleanmonoRegular)()
        descriptionLabel.numberOfLines = 0
        
        divider.backgroundColor = .orange
        
        detailView.backgroundColor = .red
    }
    
    func bind() {
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

//해보니까 프리뷰가 되긴 되는데
//Cell의 뷰들을 잘게 나누고, 잘게 나는 뷰에 대해서 프리뷰를 만들고
//넣어줄 FakeViewModel이 필요하고
//프리뷰에서 쓸 뷰가 호출할 메소드는 아주 간략해야 할 것으로 보인다....
extension StudyListCell {
    func injectFakeData() {
        titleLabel.text = "Bear Fried"
        descriptionLabel.text = "Declartive UI"
    }
    
    func showFakeDetailView() {
        self.detailViewHeightConstraint.constant = 100
        self.descriptionLabel.textColor = .red
        self.detailView.isHidden = false
    }
    
    func hideFakeDetailView() {
        self.detailViewHeightConstraint.constant = 0
        self.descriptionLabel.textColor = .blue
        self.detailView.isHidden = true
    }
}

#if canImport(SwiftUI) && DEBUG
struct StudyListCellPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    // MARK: UIViewRepresentable
    func makeUIView(context: Context) -> some UIView {
        view
    }
    // MARK: UIViewRepresentable
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

#endif

#if canImport(SwiftUI) && DEBUG
struct StudyListCellPreviewProvider: PreviewProvider {
    static var previews: some View {
        StudyListCellPreview {
            let cell = StudyListCell(style: .default, reuseIdentifier: "StudyListCell")
            cell.injectFakeData()
            cell.hideFakeDetailView()
            return cell
        }.previewLayout(.fixed(width: 320, height: 100))
    }
}

#endif
