//
//  CreateIdViewController.swift
//  1st_Assignment
//
//  Created by KJ on 2022/10/07.
//

import UIKit

class KakaoSignUpViewController: UIViewController {
    
    private let startLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 120, y: 150, width: 250, height: 30))
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    // 이메일 입력 텍스트필드
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 280, width: 350, height: 29))
        textField.placeholder = "이메일 또는 전화번호"
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.textColor = .systemGray3
        return textField
    }()
    
    private let idView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 310, width: 350, height: 1))
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // 비밀번호 텍스트필드
    private let pwTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 330, width: 350, height: 29))
        textField.placeholder = "비밀번호"
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.textColor = .systemGray3
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let pwView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 360, width: 350, height: 1))
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // 비밀번호 확인 텍스트필드
    private let pwcheckTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 380, width: 350, height: 29))
        textField.placeholder = "비밀번호 확인"
        textField.font = .systemFont(ofSize: 15, weight : .medium)
        textField.textColor = .systemGray3
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let pwcheckView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 410, width: 350, height: 1))
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // 계정 만들기 버튼
    private let newIDButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 450, width: 350, height: 40))
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
        
        let components: [Any] = [startLabel, idTextField, idView, pwTextField, pwView, pwcheckTextField, pwcheckView, newIDButton]
        
        components.forEach{
            view.addSubview($0 as! UIView)
        }
    }
    
    // 로그인 화면 이동
    private func presentToWelcomeVC(){
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        self.present(welcomeVC, animated: true, completion: nil)
        
        welcomeVC.result = idTextField.text
        welcomeVC.dataBind()
    }
    
    @objc
    private func touchupNextButton(){
        presentToWelcomeVC()
    }
}
