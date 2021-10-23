//
//  SettingsViewController.swift
//  newsApp
//
//  Created by User on 20.10.21.
//

import Lottie
import UIKit

class SettingsViewController: UIViewController {
    private var settingsView = SettingsView()
    
    // MARK: - Lifecycle
    override func loadView() {
        view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView.logoutButton.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Actions
    @objc private func tappedLogoutButton() {
        guard let secondVC =  navigationController?.viewControllers[1] else { return }
        let loginVC = LoginViewController()
        if secondVC != loginVC {
            navigationController?.viewControllers[1] = LoginViewController()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}
