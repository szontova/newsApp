//
//  ViewController.swift
//  newsApp
//
//  Created by User on 12.10.21.
//

import Lottie
import SnapKit
import UIKit

class ViewController: UIViewController {
    private let animationView = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.01412864786, green: 0, blue: 0.04351914807, alpha: 1)
        setupAnimationView()
    }
    
    private func setupAnimationView() {
        view.addSubview(animationView)
        animationView.animation = Animation.named("loading")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 0.9
        animationView.play { _ in
        }
        
        animationView.snp.makeConstraints { maker in
            maker.height.equalTo(view.bounds.height * 0.6)
            maker.width.equalTo(view.bounds.height * 0.6)
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
    }
}
