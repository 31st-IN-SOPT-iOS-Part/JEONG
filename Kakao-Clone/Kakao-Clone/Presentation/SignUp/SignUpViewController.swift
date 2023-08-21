//
//  SignUpViewController.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/02/09.
//

import UIKit

import SnapKit
import Then

final class SignUpViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let kakaoStartLabel = UILabel()
    private let emailTextField = SignInTextFieldView(frame: .zero, textFieldValue: "이메일 또는 전화번호", textHidden: false)
    private let passwordTextField = SignInTextFieldView(frame: .zero, textFieldValue: "비밀번호", textHidden: true)
    private let confirmPasswordTextField = SignInTextFieldView(frame: .zero, textFieldValue: "비밀번호 확인", textHidden: true)
    private let newAccountButton = UIButton()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension SignUpViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
    
        kakaoStartLabel.do {
            $0.text = "카카오톡을 시작합니다"
            $0.font = .systemFont(ofSize: 22, weight: .medium)
        }
        
        newAccountButton.do {
            $0.setTitle("새로운 카카오계정 만들기", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 3
            $0.addTarget(self, action: #selector(newAccountButtonDidTap), for: .touchUpInside)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(kakaoStartLabel, emailTextField, passwordTextField,
                         confirmPasswordTextField, newAccountButton)
        
        kakaoStartLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(kakaoStartLabel.snp.bottom).offset(116)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        confirmPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        newAccountButton.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(26)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(21)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(44)
        }
    }
    
    // MARK: - Methods
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        welcomeVC.userName = emailTextField.passTextFieldValue()
        welcomeVC.setDataBind()
        self.present(welcomeVC, animated: true, completion: nil)
    }
    
    // MARK: - @objc Methods
    
    @objc private func newAccountButtonDidTap() {
        presentToWelcomeVC()
    }
}
