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
    let changeButton = UIButton(type: .system)
    let loadingView = UIView()
    let animationView = AnimationView()
    
    private let colors = [UIColor.lime, .carrot, .richYellow, .rosy]
    
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
        createCodeTextField()
        createNewCodeTextField()
        createOldCodeLabel()
        createNewCodeLabel()
        createLoginButton()
        createErrorLabel()
    }
    
    private func createTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Change your login code"
        titleLabel.textColor = .freeze
        titleLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(UIScreen.main.bounds.height * 0.12)
        }
    }
    
    private func createOldCodeLabel() {
        addSubview(oldCodeLabel)
        oldCodeLabel.text = "Enter your login code"
        oldCodeLabel.textColor = .freeze
        oldCodeLabel.font = UIFont(name: "Dosis-Regular", size: 16)
        oldCodeLabel.alpha = 0.5
        oldCodeLabel.snp.makeConstraints { maker in
            maker.right.equalTo(codeTextField.snp.right)
            maker.top.equalTo(codeTextField.snp.bottom).offset(5)
        }
    }
    
    private func createNewCodeLabel() {
        addSubview(newCodeLabel)
        newCodeLabel.text = "Enter your new login code"
        newCodeLabel.textColor = .freeze
        newCodeLabel.font = UIFont(name: "Dosis-Regular", size: 16)
        newCodeLabel.alpha = 0.5
        newCodeLabel.snp.makeConstraints { maker in
            maker.right.equalTo(newCodeTextField.snp.right)
            maker.top.equalTo(newCodeTextField.snp.bottom).offset(5)
        }
    }
    
    private func createErrorLabel() {
        addSubview(errorLabel)
        errorLabel.text = "Incorrect code"
        errorLabel.textColor = .rosy
        errorLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        errorLabel.isHidden = true
        errorLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(newCodeTextField).offset(UIScreen.main.bounds.height * 0.11)
        }
    }
    
    private func createTextField(textfield: SGCodeTextField) {
        addSubview(textfield)
        textfield.textColor = .freeze
        textfield.digitBackgroundColorEmpty = .clear
        textfield.digitBackgroundColor = .clear
        textfield.digitBorderColorFocused = colors.randomElement()!
        textfield.placeholder = ""
        textfield.digitBorderColor = .freeze
        textfield.digitBackgroundColorFocused = .clear
        textfield.digitSpacing = 20
        textfield.textColorFocused = .freeze
        textfield.keyboardType = .numberPad
        textfield.count = 6
        textfield.font = UIFont(name: "Dosis-Regular", size: 20)!
    }
    
    private func createCodeTextField() {
        createTextField(textfield: codeTextField)
        codeTextField.textChangeHandler = { text, _ in
            self.codeTextField.digitBorderColorFocused = self.colors.randomElement()!
            let textCount = (self.newCodeTextField.text?.count ?? 0) + (text?.count ?? 0)
            if textCount == 12 {
                self.changeButton.isUserInteractionEnabled = true
                self.changeButton.alpha = 1.0
            } else {
                self.changeButton.isUserInteractionEnabled = false
                self.changeButton.alpha = 0.5
            }
        }
        
        codeTextField.snp.makeConstraints { maker in
            maker.width.equalTo(UIScreen.main.bounds.width * 0.9)
            maker.height.equalTo(UIScreen.main.bounds.width * 0.15)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(titleLabel).inset(UIScreen.main.bounds.width * 0.2)
        }
    }
    
    private func createNewCodeTextField() {
        createTextField(textfield: newCodeTextField)
        newCodeTextField.textChangeHandler = { text, _ in
            self.newCodeTextField.digitBorderColorFocused = self.colors.randomElement()!
            let textCount = (self.codeTextField.text?.count ?? 0) + (text?.count ?? 0)
            if textCount == 12 {
                self.changeButton.isUserInteractionEnabled = true
                self.changeButton.alpha = 1.0
            } else {
                self.changeButton.isUserInteractionEnabled = false
                self.changeButton.alpha = 0.5
            }
        }
        
        newCodeTextField.snp.makeConstraints { maker in
            maker.width.equalTo(UIScreen.main.bounds.width * 0.9)
            maker.height.equalTo(UIScreen.main.bounds.width * 0.15)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(codeTextField).inset(UIScreen.main.bounds.width * 0.4)
        }
    }
    
    private func createLoginButton() {
        addSubview(changeButton)
        changeButton.backgroundColor = colors.randomElement()
        changeButton.setTitle("Change", for: .normal)
        changeButton.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
            maker.top.equalTo(UIScreen.main.bounds.height * 0.8)
            maker.height.equalTo(50)
        }
        changeButton.layer.cornerRadius = 20
        changeButton.setTitleColor(.white, for: .normal)
        changeButton.titleLabel?.font = UIFont(name: "Dosis-Regular", size: 24)
        changeButton.isUserInteractionEnabled = false
        changeButton.alpha = 0.5
    }
    
}
