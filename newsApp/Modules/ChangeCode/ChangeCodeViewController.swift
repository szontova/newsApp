//
//  ChangeCodeViewController.swift
//  newsApp
//
//  Created by User on 24.10.21.
//

import UIKit

class ChangeCodeViewController: UIViewController {
    
    private var changeCodeView = ChangeCodeView()

    // MARK: - Lifecycle
    override func loadView() {
        view = changeCodeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
