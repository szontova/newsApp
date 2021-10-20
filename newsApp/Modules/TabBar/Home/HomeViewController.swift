//
//  HomeController.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    
    private var viewModel: HomeViewModel!

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
            maker.top.equalTo(titleLabel)
            maker.width.equalToSuperview()
            maker.height.equalTo(view.bounds.height * 0.8)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate { }

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("-> \(viewModel.news.count)")
        return viewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
