//
//  FriendListViewController.swift
//  Assignment_Kakao
//
//  Created by KJ on 2022/10/11.
//

import UIKit

class FriendTabViewController: UIViewController {
    
    private lazy var containerView = UIScrollView()
    
    private let friendLabel: UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let settingImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "settings 1")
        return imgView
    }()
    
    private let profileImgButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "friendtab_profileImg"), for: .normal)
        button.addTarget(self, action: #selector(presentToProfileVC), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    // 프로필 연결
    @objc
    private func presentToProfileVC(){
        let profileVC = ProfileViewController()
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true)
    }
}

extension FriendTabViewController{
    private func layout(){
        view.addSubview(containerView)
        containerView.addSubviews([friendLabel, settingImg, profileImgButton])

        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        friendLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(12)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.width.equalTo(41)
        }
        
        settingImg.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.leading.equalTo(friendLabel.snp.trailing).offset(2)
            make.width.height.equalTo(21)
        }
        
        profileImgButton.snp.makeConstraints { make in
            make.top.equalTo(friendLabel.snp.bottom).offset(31)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.width.height.equalTo(59)
        }
    }
}
