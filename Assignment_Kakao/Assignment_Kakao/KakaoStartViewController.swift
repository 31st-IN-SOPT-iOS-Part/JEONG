//
//  ViewController.swift
//  1st_Assignment
//
//  Created by KJ on 2022/10/07.
//

import UIKit
import SnapKit

class KakaoStartViewController: UIViewController {
    private let startLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let explainLabel: UILabel = {
        let label = UILabel()
        label.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요."
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 2 // 줄 수 2개
        label.textAlignment = .center
        return label
    }()
    
    // 이메일 텍스트필드
    private let EmailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 또는 전화번호"
        textField.font = .systemFont(ofSize: 17, weight: .medium)
        textField.textColor = .systemGray3
        return textField
    }()
    
    private let IDView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // 비밀번호 텍스트필드
    private let pwTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = .systemFont(ofSize: 17, weight: .medium)
        textField.textColor = .systemGray3
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let pwView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // 로그인 버튼
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black , for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 5 // 버튼 모서리 둥글게
        button.addTarget(self, action: #selector(welcomeNextButton), for: .touchUpInside)
        return button
    }()
    
    // 계정 생성 버튼
    private let newIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black , for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 5 // 버튼 모서리 둥글게
        button.addTarget(self, action: #selector(createNextButton), for: .touchUpInside)
        return button
    }()
    
    private let findID: UILabel = {
        let label = UILabel()
        label.text = "카카오계정 또는 비밀번호 찾기"
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    // 로그인 화면 이동
    private func presentToWelcomeVC(){
        let welcomeVC = WelcomeViewController()
        self.present(welcomeVC, animated: true, completion: nil)
        
        welcomeVC.result = EmailTextField.text
        welcomeVC.dataBind()
    }
    
    // 계정 생성 화면 이동
    private func pushToCreateidVC(){
        let secondVC = KakaoSignUpViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc
    private func createNextButton(){
        pushToCreateidVC()
    }
    
    @objc
    private func welcomeNextButton(){
        presentToWelcomeVC()
        
    }
}

// 함수로 묶어서 정리
extension KakaoStartViewController {
    func layout(){
        
        // addSubviews 함수 사용
        view.addSubviews([startLabel, explainLabel, EmailTextField, IDView, pwTextField, pwView, loginButton, newIDButton, findID])
        
        startLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(89)
        }
        
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(self.startLabel.snp.bottom).offset(20)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(67)
            make.width.equalTo(240)
        }
        
        EmailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.explainLabel.snp.bottom).offset(60)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
        }
        
        IDView.snp.makeConstraints { make in
            make.top.equalTo(self.EmailTextField.snp.bottom).offset(13)
            make.leading.equalTo(self.EmailTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(self.IDView.snp.bottom).offset(23)
            make.leading.equalTo(self.EmailTextField)
            make.width.equalTo(333)
        }
        
        pwView.snp.makeConstraints { make in
            make.top.equalTo(self.pwTextField.snp.bottom).offset(10)
            make.leading.equalTo(self.EmailTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.pwView.snp.bottom).offset(35)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            make.height.equalTo(44)
        }
        
        newIDButton.snp.makeConstraints { make in
            make.top.equalTo(self.loginButton.snp.bottom).offset(10)
            make.leading.trailing.equalTo(loginButton)
            make.height.equalTo(loginButton)
        }
        
        findID.snp.makeConstraints { make in
            make.top.equalTo(self.newIDButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(110)
        }
    }
}
