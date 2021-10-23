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
    let changeLanguageButton = UIButton(type: .system)
    let changeCodeButton = UIButton(type: .system)
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
        createChangeLanguageButton()
        createChangeCodeButton()
        createLogoutButton()
    }
    
    private func createChangeLanguageButton() {
        addSubview(changeLanguageButton)
        changeLanguageButton.layer.borderWidth = 1
        changeLanguageButton.layer.borderColor = UIColor.lime.cgColor
        changeLanguageButton.setTitle("Change language", for: .normal)
        changeLanguageButton.setTitleColor(.white, for: .normal)
        changeLanguageButton.titleLabel?.font = UIFont(name: "Dosis-Regular", size: 20)
        changeLanguageButton.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(UIScreen.main.bounds.height * 0.06)
            maker.top.equalTo(titleLabel.snp.bottom).offset(UIScreen.main.bounds.height * 0.04)
        }
    }
    
    private func createChangeCodeButton() {
        addSubview(changeCodeButton)
        changeCodeButton.layer.borderWidth = 1
        changeCodeButton.layer.borderColor = UIColor.richYellow.cgColor
        changeCodeButton.setTitle("Change code", for: .normal)
        changeCodeButton.setTitleColor(.white, for: .normal)
        changeCodeButton.titleLabel?.font = UIFont(name: "Dosis-Regular", size: 20)
        changeCodeButton.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(UIScreen.main.bounds.height * 0.06)
            maker.top.equalTo(changeLanguageButton.snp.bottom).offset(UIScreen.main.bounds.height * 0.04)
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
            maker.height.equalTo(UIScreen.main.bounds.height * 0.06)
            maker.top.equalTo(changeCodeButton.snp.bottom).offset(UIScreen.main.bounds.height * 0.04)
        }
    }

}
