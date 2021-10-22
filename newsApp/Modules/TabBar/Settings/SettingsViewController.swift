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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
