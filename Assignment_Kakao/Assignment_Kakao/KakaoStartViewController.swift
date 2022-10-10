//
//  ViewController.swift
//  1st_Assignment
//
//  Created by KJ on 2022/10/07.
//

import UIKit

class KakaoStartViewController: UIViewController {
    
    private let startLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 120, y: 150, width: 250, height: 30))
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let explainLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 170, width: 500, height: 100))
        label.text = "      사용하던 카카오계정이 있다면 \n메일 또는 전화번호로 로그인해주세요."
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2 // 줄 수 2개
        return label
    }()
    
    // 이메일 텍스트필드
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
    
    // 로그인 버튼
    private let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 400, width: 350, height: 40))
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black , for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 5 // 버튼 모서리 둥글게
        button.addTarget(self, action: #selector(welcomeNextButton), for: .touchUpInside)
        return button
    }()
    
    // 계정 생성 버튼
    private let newidButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 450, width: 350, height: 40))
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black , for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 5 // 버튼 모서리 둥글게
        button.addTarget(self, action: #selector(createNextButton), for: .touchUpInside)
        return button
    }()
    
    private let findid: UILabel = {
        let label = UILabel(frame: CGRect(x: 120, y: 510, width: 300, height: 30))
        label.text = "카카오계정 또는 비밀번호 찾기"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [startLabel, explainLabel, idTextField, idView, pwTextField, pwView, loginButton, newidButton, findid]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
    }
    
    // 로그인 화면 이동
    private func presentToWelcomeVC(){
        let welcomeVC = WelcomeViewController()
        self.present(welcomeVC, animated: true, completion: nil)
        
        welcomeVC.result = idTextField.text
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

