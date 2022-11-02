//
//  FriendListViewController.swift
//  Assignment_Kakao
//
//  Created by KJ on 2022/10/11.
//

import UIKit

class FriendTabViewController: UIViewController {
    
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
    
    private let profileView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "권정"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let stateLabel: UILabel = {
        let label = UILabel()
        label.text = "ㅇㅇㅇㅇ"
        label.textColor = 0x1E1E1E.color
        label.font = .systemFont(ofSize: 11, weight: .light)
        return label
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
        tableView.dataSource = self
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
        register()
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
        [profileImgButton, nameLabel, stateLabel].forEach{
            profileView.addSubview($0)
        }
        view.addSubviews([friendLabel, settingImg, profileView, friendTableView])
        
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
        
        profileView.snp.makeConstraints { make in
            make.top.equalTo(friendLabel.snp.bottom).offset(16)
            make.leading.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        
        profileImgButton.snp.makeConstraints { make in
            make.top.centerY.equalToSuperview()
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.width.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileView.snp.top).offset(20)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(86)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.leading.equalTo(nameLabel)
        }
        
        friendTableView.snp.makeConstraints { make in
            make.top.equalTo(profileView.snp.bottom)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            // make.height.equalTo(50 * friendList.count)
        }
    }
    
    private func register() {
        friendTableView.register(FriendListTableViewCell.self,
                                 forCellReuseIdentifier: FriendListTableViewCell.identifier
        )
    }
}

extension FriendTabViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65 // 셀 하나의 높이
    }
}

extension FriendTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let FriendCell = tableView.dequeueReusableCell(withIdentifier: FriendListTableViewCell.identifier, for: indexPath)
                as? FriendListTableViewCell else { return UITableViewCell() }
        FriendCell.dataBind(model: friendList[indexPath.row])
        return FriendCell
    }
}
