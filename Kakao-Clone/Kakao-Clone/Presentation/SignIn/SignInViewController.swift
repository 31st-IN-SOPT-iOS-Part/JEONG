//
//  ViewController.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/02/07.
//

import UIKit

import SnapKit
import Then

final class SignInViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let kakaoStartLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let emailTextField = SignInTextFieldView(frame: .zero, textFieldValue: "이메일 또는 전화번호", textHidden: false)
    private let passwordTextField = SignInTextFieldView(frame: .infinite, textFieldValue: "비밀번호", textHidden: true)
    private let kakaoLoginButton = UIButton()
    private let makeAccountButton = UIButton()
    private let findAccountLabel = UILabel()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension SignInViewController {
    
    // MARK: - UIComponents Propertys
    
    func setUI() {
        view.backgroundColor = .white
        
        kakaoStartLabel.do {
            $0.text = "카카오톡을 시작합니다"
            $0.font = .systemFont(ofSize: 22, weight: .medium)
        }
        
        descriptionLabel.do {
            $0.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
            $0.font = .systemFont(ofSize: 15, weight: .regular)
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        
        kakaoLoginButton.do {
            $0.setTitle("카카오계정 로그인", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 3
            $0.addTarget(self, action: #selector(kakaoLoginButtonDidTap), for: .touchUpInside)
        }
        
        makeAccountButton.do {
            $0.setTitle("새로운 카카오계정 만들기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 3
            $0.addTarget(self, action: #selector(makeAccountLoginButtonDidTap), for: .touchUpInside)
        }
        
        findAccountLabel.do {
            $0.text = "카카오계정 또는 비밀번호 찾기"
            $0.font = .systemFont(ofSize: 13, weight: .light)
        }
    }
    
    // MARK: - Layout Helper
    
    func setLayout() {
        
        view.addSubviews(kakaoStartLabel, descriptionLabel, emailTextField,
                         passwordTextField, kakaoLoginButton, makeAccountButton,
                         findAccountLabel)
        
        kakaoStartLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(kakaoStartLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(60)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(21)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(44)
        }
        
        makeAccountButton.snp.makeConstraints {
            $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(44)
        }
        
        findAccountLabel.snp.makeConstraints {
            $0.top.equalTo(makeAccountButton.snp.bottom).offset(20)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            
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
    
    private func pushToSignUpVC() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc private func kakaoLoginButtonDidTap() {
        presentToWelcomeVC()
    }
    
    @objc private func makeAccountLoginButtonDidTap() {
        pushToSignUpVC()
    }
}

