//
//  SettingsViewController.swift
//  newsApp
//
//  Created by User on 20.10.21.
//

import Lottie
import UIKit

class SettingsViewController: UIViewController {
    private let label = UILabel()
    private let animationView = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkness
        createLabel()
        createAnimationView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationView.play()
    }
    
    private func createLabel() {
        view.addSubview(label)
        label.text = "In developing..."
        label.font = UIFont(name: "Dosis-Regular", size: 24)
        label.textColor = .freeze
        label.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
    }
    
    private func createAnimationView() {
        view.addSubview(animationView)
        animationView.animation = Animation.named("christmas-spin")
        animationView.contentMode = .scaleAspectFit
        animationView.alpha = 0.8
        animationView.loopMode = .loop
        
        animationView.snp.makeConstraints { maker in
            maker.height.equalTo(view.bounds.height * 0.3)
            maker.width.equalTo(view.bounds.height * 0.3)
            maker.centerX.equalToSuperview()
            maker.bottom.equalTo(label).inset(-view.bounds.width * 0.1)
        }
    }
}
