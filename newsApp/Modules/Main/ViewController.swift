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
        view.backgroundColor = .darkness
        createAnimationView()
    }
    
    private func createAnimationView() {
        view.addSubview(animationView)
        animationView.animation = Animation.named("loading")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 0.9
        animationView.play { _ in
            self.performSegue(withIdentifier: "toSignInSegue", sender: nil)
        }
        
        animationView.snp.makeConstraints { maker in
            maker.height.equalTo(view.bounds.height * 0.7)
            maker.width.equalTo(view.bounds.height * 0.7)
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
    }
}
