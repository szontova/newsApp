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
    }
}
