//
//  CreateIdViewController.swift
//  1st_Assignment
//
//  Created by KJ on 2022/10/07.
//

import UIKit

class KakaoSignUpViewController: UIViewController {
    
    private let startLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    // 이메일 입력 텍스트필드
    private let IDTextField: UITextField = {
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
    
    // 비밀번호 확인 텍스트필드
    private let pwcheckTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호 확인"
        textField.font = .systemFont(ofSize: 17, weight : .medium)
        textField.textColor = .systemGray3
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let pwcheckView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // 계정 만들기 버튼
    private let newIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black , for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 5 // 버튼 모서리 둥글게
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    // 로그인 화면 이동
    private func presentToWelcomeVC(){
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        self.present(welcomeVC, animated: true, completion: nil)
        
        welcomeVC.result = IDTextField.text
        welcomeVC.dataBind()
    }
    
    @objc
    private func touchupNextButton(){
        presentToWelcomeVC()
    }
}

extension KakaoSignUpViewController{
    private func layout(){
        // forEach 사용
        [startLabel, IDTextField, IDView, pwTextField, pwView, pwcheckTextField, pwcheckView, newIDButton].forEach{
            view.addSubview($0)
        }
        
        startLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(95)
            make.width.equalTo(197)
        }
        
        IDTextField.snp.makeConstraints { make in
            make.top.equalTo(self.startLabel).offset(129)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
        }
        
        IDView.snp.makeConstraints { make in
            make.top.equalTo(self.IDTextField.snp.bottom).offset(13)
            make.leading.equalTo(self.IDTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(self.IDView.snp.bottom).offset(23)
            make.leading.trailing.equalTo(self.IDTextField)
            make.width.equalTo(self.IDTextField)
        }
        
        pwView.snp.makeConstraints { make in
            make.top.equalTo(self.pwTextField.snp.bottom).offset(13)
            make.leading.equalTo(self.pwTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        pwcheckTextField.snp.makeConstraints { make in
            make.top.equalTo(self.pwView.snp.bottom).offset(23)
            make.leading.trailing.equalTo(self.IDTextField)
            make.width.equalTo(self.IDTextField)
        }
        
        pwcheckView.snp.makeConstraints { make in
            make.top.equalTo(self.pwcheckTextField.snp.bottom).offset(13)
            make.leading.equalTo(self.pwcheckTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        newIDButton.snp.makeConstraints { make in
            make.top.equalTo(self.pwcheckView.snp.bottom).offset(35)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            make.height.equalTo(44)
        }
    }
}
