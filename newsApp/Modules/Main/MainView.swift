//
//  MainView.swift
//  newsApp
//
//  Created by User on 22.10.21.
//

import Lottie
import SnapKit
import UIKit

class MainView: UIView {
    let animationView = AnimationView()
    let label = UILabel()
    
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
        createAnimationView()
    }
    
    private func createAnimationView() {
        addSubview(animationView)
        animationView.animation = Animation.named("loading")
        animationView.contentMode = .scaleAspectFit
        
        animationView.snp.makeConstraints { maker in
            maker.height.equalTo(UIScreen.main.bounds.height * 0.7)
            maker.width.equalTo(UIScreen.main.bounds.height * 0.7)
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
    }
}
