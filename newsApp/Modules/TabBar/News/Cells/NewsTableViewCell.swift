//
//  NewsTableViewCell.swift
//  newsApp
//
//  Created by User on 20.10.21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let subLabel = UILabel()
    private let titleImageView = UIImageView()
    
    static let identifier = "newsTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .darkness
        createTitleLabel()
        createTitleImageView()
        createSubLabel()
    }
    
    static var nib: UINib {
        UINib(nibName: String(describing: Self.self), bundle: Bundle.main)
    }
    
    func configure(news: NewsModel) {
        titleLabel.text = news.title
        let url = URL(string: news.urlToImage)!
        if let data = try? Data(contentsOf: url) {
            titleImageView.image = UIImage(data: data)
        }
        subLabel.text = news.description
    }
    
    private func createTitleLabel() {
       contentView.addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Dosis-Regular", size: 16)
        titleLabel.textColor = .freeze
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(contentView.bounds.height * 0.05)
            maker.width.equalTo(contentView.bounds.width * 0.8)
        }
    }
    
    private func createTitleImageView() {
       contentView.addSubview(titleImageView)
        titleImageView.layer.masksToBounds = true
        titleImageView.layer.cornerRadius = 20
        titleImageView.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel).inset(contentView.bounds.height * 0.2)
            maker.width.equalTo(contentView.bounds.width * 0.4)
            maker.height.equalTo(contentView.bounds.width * 0.3)
        }
    }
    
    private func createSubLabel() {
       contentView.addSubview(subLabel)
        subLabel.font = UIFont(name: "Dosis-Regular", size: 18)
        subLabel.textColor = .freeze
        subLabel.numberOfLines = 5
        subLabel.textAlignment = .justified
        subLabel.snp.makeConstraints { maker in
            maker.top.equalTo(titleImageView).inset(10)
            maker.left.equalTo(titleImageView.snp.right).inset(-20)
            maker.width.equalTo(contentView.bounds.width * 0.4)
        }
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
