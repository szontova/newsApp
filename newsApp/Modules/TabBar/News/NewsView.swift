//
//  NewsView.swift
//  newsApp
//
//  Created by User on 22.10.21.
//

import UIKit

class NewsView: UIView {
    let titleLabel = UILabel()
    let tableView = UITableView(frame: .zero)
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .darkness
        createTitleLabel()
        createTableView()
    }
    
    // MARK: - Setup
    private func createTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "news_title".localized()
        titleLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        titleLabel.textColor = .freeze
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(UIScreen.main.bounds.height * 0.1)
        }
    }
    
    private func createTableView() {
        addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel).inset(UIScreen.main.bounds.height * 0.04)
            maker.width.equalToSuperview()
            maker.height.equalTo(UIScreen.main.bounds.height * 0.8)
        }
    }

}
