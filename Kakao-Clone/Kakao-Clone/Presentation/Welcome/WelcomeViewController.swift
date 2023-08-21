//
//  WelcomeViewController.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/02/09.
//

import UIKit

import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let userNameLabel = UILabel()
    private let checkButton = UIButton()
    
    // MARK: - Properties
    
    var userName: String?
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension WelcomeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        userNameLabel.do {
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        
        checkButton.do {
            $0.setTitle("확인", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
            $0.backgroundColor = .systemYellow
            $0.layer.cornerRadius = 3
            $0.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(userNameLabel, checkButton)
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(241)
            $0.centerX.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(117)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(21)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(44)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind() {
        guard let userName = self.userName else { return }
        userNameLabel.text = "\(userName)님\n환영합니다"
    }
    
    // MARK: - @objc Methods
    
    @objc private func checkButtonDidTap() {
        self.dismiss(animated: true, completion: nil)
    }
}
