//
//  HomeController.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import UIKit

class NewsViewController: UIViewController {
    
    private var newsView = NewsView()
    private var viewModel: HomeViewModel!

    // MARK: - Lifecycle
    override func loadView() {
        view = newsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        newsView.tableView.reloadData()
    }
    
    private func setupTableView() {
        newsView.tableView.delegate = self
        newsView.tableView.dataSource = self
        newsView.tableView.estimatedRowHeight = 200
        newsView.tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
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
