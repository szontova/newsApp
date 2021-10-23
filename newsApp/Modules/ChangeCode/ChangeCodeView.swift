//
//  ChangeCodeView.swift
//  newsApp
//
//  Created by User on 24.10.21.
//

import Lottie
import SGCodeTextField
import UIKit

class ChangeCodeView: UIView {
    let titleLabel = UILabel()
    let newCodeLabel = UILabel()
    let oldCodeLabel = UILabel()
    let errorLabel = UILabel()
    let codeTextField = SGCodeTextField()
    let newCodeTextField = SGCodeTextField()
    let backButton = UIButton(type: .system)
    
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
    }
    
    private func createTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Change your login code"
        titleLabel.textColor = .freeze
        titleLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(UIScreen.main.bounds.height * 0.15)
        }
    }
    
}
