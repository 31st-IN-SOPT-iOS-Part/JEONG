//
//  WelcomeViewController.swift
//  1st_Assignment
//
//  Created by KJ on 2022/10/07.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black , for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 5 // 버튼 모서리 둥글게
        button.addTarget(self, action: #selector(moveToFriendTabVC), for: .touchUpInside)
        return button
    }()
    
    var result: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    func dataBind(){
        guard let result = self.result else { return }
        nameLabel.text = "\(result)님 \n 환영합니다"
    }
    
    @objc
    private func moveToFriendTabVC(){ // 뷰 전환
        let mainViewController = FriendTabViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = navigationController
    }
}

extension WelcomeViewController{
    private func layout(){
        view.addSubviews([nameLabel, checkButton])
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(241)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(144)
            make.height.equalTo(60)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(117)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            make.height.equalTo(44)
        }
    }
}
