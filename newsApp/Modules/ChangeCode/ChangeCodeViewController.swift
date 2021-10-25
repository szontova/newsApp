//
//  ChangeCodeViewController.swift
//  newsApp
//
//  Created by User on 24.10.21.
//

import Lottie
import UIKit

class ChangeCodeViewController: UIViewController {
    
    private var changeCodeView = ChangeCodeView()
    private var changeCodeViewModel: ChangeCodeViewModel!

    // MARK: - Lifecycle
    override func loadView() {
        view = changeCodeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeCodeViewModel = ChangeCodeViewModel()
        addActions()
    }
    
    // MARK: - Setup
    private func setupAnimationView() {
        changeCodeView.animationView.isHidden = false
        changeCodeView.animationView.loopMode = .playOnce
        changeCodeView.animationView.animationSpeed = 0.9
        changeCodeView.animationView.play { _ in
            UIView.transition(with: self.view, duration: 0.3, options: .transitionCrossDissolve, animations: {
                self.moveToSettings()
            })
        }
    }
    
    private func setupDoneAnimationView() {
        changeCodeView.doneAnimationView.isHidden = false
        changeCodeView.doneAnimationView.loopMode = .playOnce
        changeCodeView.doneAnimationView.animationSpeed = 0.9
        changeCodeView.doneAnimationView.play { _ in
            UIView.transition(with: self.view, duration: 1, options: .transitionCrossDissolve, animations: {
                self.navigationController?.popViewController(animated: true)
            })
        }
    }
    
    // MARK: - Logic
    private func isCodeCorrect() -> Bool {
        if changeCodeView.codeTextField.text == changeCodeViewModel.user[0].code {
            return true
        }
        return false
    }
    
    private func moveToSettings() {
        if isCodeCorrect() {
            changeCodeView.animationView.isHidden = true
            setupDoneAnimationView()
            changeCodeViewModel.user[0].code = changeCodeView.newCodeTextField.text ?? ""
            changeCodeViewModel.updateUser(item: changeCodeViewModel.user[0])
        } else {
            changeCodeView.loadingView.isHidden = true
            changeCodeView.errorLabel.isHidden = false
        }
    }
    
    // MARK: - Actions
    private func addActions() {
        changeCodeView.backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        changeCodeView.changeButton.addTarget(self, action: #selector(tappedChangeButton), for: .touchUpInside)
    }
    
    @objc private func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func tappedChangeButton() {
        UIView.transition(with: view, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeCodeView.loadingView.isHidden = false
            self.setupAnimationView()
        })
    }
}
