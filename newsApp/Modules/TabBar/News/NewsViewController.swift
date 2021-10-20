//
//  HomeController.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import UIKit

class NewsViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let tableView = UITableView(frame: .zero)
    
    private var viewModel: HomeViewModel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkness
        viewModel = HomeViewModel()
        createTitleLabel()
        createTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Setup
    private func createTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "News"
        titleLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        titleLabel.textColor = .freeze
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(view.bounds.height * 0.1)
        }
    }
    
    private func createTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel).inset(view.bounds.width * 0.1)
            maker.width.equalToSuperview()
            maker.height.equalTo(view.bounds.height * 0.8)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        tableView.register(NewsTableViewCell.nib, forCellReuseIdentifier: NewsTableViewCell.identifier)
    }
}

// MARK: - UITableViewDelegate
extension NewsViewController: UITableViewDelegate { }

// MARK: - UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(news: viewModel.news[indexPath.item])
        
        return cell
    }
}
