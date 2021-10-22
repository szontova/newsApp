//
//  SettingsView.swift
//  newsApp
//
//  Created by User on 22.10.21.
//

import UIKit

class SettingsView: UIView {
    let titleLabel = UILabel()
    let versionLabel = UILabel()
    let oneButton = UIButton(type: .system)
    let twoButton = UIButton(type: .system)
    let logoutButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func configureUI() {
        backgroundColor = .darkness
        createTitleLabel()
        createButtons()
    }
    
    private func createTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Settings"
        titleLabel.textColor = .freeze
        titleLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(UIScreen.main.bounds.height * 0.1)
        }
    }
    
    private func createButtons() {
        createOneButton()
        createTwoButton()
        createLogoutButton()
    }
    
    private func createOneButton() {
        addSubview(oneButton)
        oneButton.layer.borderWidth = 1
        oneButton.layer.borderColor = UIColor.lime.cgColor
        oneButton.setTitle("Change language", for: .normal)
        oneButton.setTitleColor(.white, for: .normal)
        oneButton.titleLabel?.font = UIFont(name: "Dosis-Regular", size: 20)
        oneButton.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(UIScreen.main.bounds.height * 0.05)
            maker.top.equalTo(titleLabel.snp.bottom).offset(UIScreen.main.bounds.height * 0.04)
        }
    }
    
    private func createTwoButton() {
        addSubview(twoButton)
        twoButton.layer.borderWidth = 1
        twoButton.layer.borderColor = UIColor.richYellow.cgColor
        twoButton.setTitle("Change code", for: .normal)
        twoButton.setTitleColor(.white, for: .normal)
        twoButton.titleLabel?.font = UIFont(name: "Dosis-Regular", size: 20)
        twoButton.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(UIScreen.main.bounds.height * 0.05)
            maker.top.equalTo(oneButton.snp.bottom).offset(UIScreen.main.bounds.height * 0.04)
        }
    }
    
    private func createLogoutButton() {
        addSubview(logoutButton)
        logoutButton.layer.borderWidth = 1
        logoutButton.layer.borderColor = UIColor.rosy.cgColor
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.titleLabel?.font = UIFont(name: "Dosis-Regular", size: 20)
        logoutButton.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(UIScreen.main.bounds.height * 0.05)
            maker.top.equalTo(twoButton.snp.bottom).offset(UIScreen.main.bounds.height * 0.04)
        }
    }

}
