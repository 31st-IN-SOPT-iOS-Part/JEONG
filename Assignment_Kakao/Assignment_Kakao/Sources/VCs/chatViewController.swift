//
//  ChatViewController.swift
//  Assignment_Kakao
//
//  Created by KJ on 2022/11/02.
//

import UIKit

class ChatViewController: UIViewController {
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.text = "채팅"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let openchatLabel: UILabel = {
        let label = UILabel()
        label.text = "오픈채팅"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .systemGray2
        return label
    }()
    
    private let plusImgButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "iconPlus"), for: .normal)
        // button.addTarget(self, action: #selector(presentToProfileVC), for: .touchUpInside)
        return button
    }()
    
    private let settingImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "settings 1")
        return imgView
    }()
    
    private let mychatImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "kwonjeong_iOS")
        imgView.layer.cornerRadius = 20.adjusted
        return imgView
    }()
    
    private lazy var chatCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
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
}

extension ChatViewController{
    private func layout(){
        view.backgroundColor = .white
        view.addSubviews([chatLabel, openchatLabel, plusImgButton, settingImg, mychatImg, chatCollectionView])
        
        chatLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
        }
        
        openchatLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(65)
        }
        
        plusImgButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(50)
        }
        
        settingImg.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.width.height.equalTo(21)
        }
        
        mychatImg.snp.makeConstraints { make in
            make.top.equalTo(plusImgButton.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(70)
        }
        
        chatCollectionView.snp.makeConstraints { make in
            make.top.equalTo(mychatImg.snp.bottom).offset(10)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    
    private func register() {
        chatCollectionView.register(ChatCollectionViewCell.self,
                                    forCellWithReuseIdentifier: ChatCollectionViewCell.identifier
        )
    }
}

extension ChatViewController: UICollectionViewDelegate {

}

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let FriendCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath)
                as? ChatCollectionViewCell else { return UICollectionViewCell() }
        FriendCell.dataBind(model: friendList[indexPath.item])
        return FriendCell
    }
}

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth, height: 60)
    }
}

