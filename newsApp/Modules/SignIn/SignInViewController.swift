//
//  SignInViewController.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import UIKit

class SignInViewController: UIViewController {
    private let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.01412864786, green: 0, blue: 0.04351914807, alpha: 1)
        createTitleLabel()
    }
    
    private func createTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "Enter your login code"
        titleLabel.textColor = #colorLiteral(red: 0.9339585077, green: 0.9601209991, blue: 1, alpha: 1)
        titleLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(view.bounds.height * 0.2)
        }
    }
}
