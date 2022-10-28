//
//  FriendListViewController.swift
//  Assignment_Kakao
//
//  Created by KJ on 2022/10/11.
//

import UIKit

class FriendTabViewController: UIViewController, UITableViewDelegate {
    
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
    
    private lazy var friendTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black.withAlphaComponent(0.1)
        tableView.delegate = self
        tableView.backgroundColor = .green
        // tableView.dataSource = self
        return tableView
    }()
    
    var friendList: [FriendModel] = [
        FriendModel(profileImage: "profileImage1", profileName: "김솝트", stateMessage: "졸려"),
        FriendModel(profileImage: "profileImage2", profileName: "김솝트", stateMessage: "졸려"),
        FriendModel(profileImage: "profileImage3", profileName: "김솝트", stateMessage: "졸려"),
        FriendModel(profileImage: "profileImage4", profileName: "김솝트", stateMessage: "졸려"),
        FriendModel(profileImage: "profileImage5", profileName: "김솝트", stateMessage: "졸려"),
        FriendModel(profileImage: "profileImage6", profileName: "김솝트", stateMessage: "졸려"),
        FriendModel(profileImage: "profileImage7", profileName: "김솝트", stateMessage: "졸려"),
        FriendModel(profileImage: "profileImage8", profileName: "김솝트", stateMessage: "졸려"),
        FriendModel(profileImage: "profileImage9", profileName: "김솝트", stateMessage: "졸려")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
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
        view.backgroundColor = .white
        view.addSubviews([friendLabel, settingImg, profileImgButton, friendTableView])
        
        friendLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.width.equalTo(41)
        }
        
        settingImg.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.width.height.equalTo(21)
        }
        
        profileImgButton.snp.makeConstraints { make in
            make.top.equalTo(friendLabel.snp.bottom).offset(23)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.width.height.equalTo(59)
        }
        
        friendTableView.snp.makeConstraints { make in
            make.top.equalTo(profileImgButton.snp.bottom).offset(11)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            // make.height.equalTo(50 * friendList.count)
        }
    }
}
