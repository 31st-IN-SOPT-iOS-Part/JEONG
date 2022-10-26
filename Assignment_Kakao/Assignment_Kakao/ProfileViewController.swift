//
//  ProfileViewController.swift
//  Assignment_Kakao
//
//  Created by KJ on 2022/10/11.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // x 버튼
    lazy var profileCloseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile_closeBtn"), for: .normal)
        button.addTarget(self, action: #selector(friendTabBackButton), for: .touchUpInside)
        return button
    }()
    
    // 프로필 사진
    private let profileImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "friendtab_profileImg")
        return imgView
    }()
    
    // 프로필 이름
    private let profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "권정"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // 가로선
    private let profileLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(displayP3Red: 159/255, green: 167/255, blue: 173/255, alpha: 1)
        return view
    }()
    
    // 나와의 채팅
    private let selfTalkBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.init(displayP3Red: 135/255, green: 145/255, blue: 152/255, alpha: 1)
        button.setImage(UIImage(named: "profileTalkImg"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("나와의 채팅", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.imageEdgeInsets = .init(top: 15, left: 35, bottom: 30, right: 0)
        button.titleEdgeInsets = .init(top: 35, left: 0, bottom: 0, right: 20)
        return button
    }()
    
    private let editBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.init(displayP3Red: 135/255, green: 145/255, blue: 152/255, alpha: 1)
        button.setImage(UIImage(named: "profile_editImg"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("프로필 편집", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.imageEdgeInsets = .init(top: 15, left: 35, bottom: 30, right: 0)
        button.titleEdgeInsets = .init(top: 35, left: 0, bottom: 0, right: 20)
        return button
    }()
    
    private let storyBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.init(displayP3Red: 135/255, green: 145/255, blue: 152/255, alpha: 1)
        button.setImage(UIImage(named: "profileStoryImg"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("카카오스토리", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.imageEdgeInsets = .init(top: 15, left: 40, bottom: 30, right: 0)
        button.titleEdgeInsets = .init(top: 35, left: 0, bottom: 0, right: 20)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(displayP3Red: 135/255, green: 145/255, blue: 152/255, alpha: 1)
        
        // addSubviews 함수 사용
        view.addSubviews([profileCloseButton, profileImg, profileNameLabel, profileLine, selfTalkBtn, editBtn, storyBtn])
        
        profileCloseButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(18)
            make.height.width.equalTo(14)
        }
        
        profileImg.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(460)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(139)
            make.height.width.equalTo(97)
        }
        
        profileNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImg.snp.bottom).offset(8)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(100)
        }
        
        profileLine.snp.makeConstraints { make in
            make.top.equalTo(profileNameLabel.snp.bottom).offset(42)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(0)
            make.height.equalTo(1)
            make.width.equalTo(375.02)
        }
        
        selfTalkBtn.snp.makeConstraints { make in
            make.top.equalTo(profileLine.snp.bottom).offset(12)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(44)
            make.width.equalTo(96)
            make.height.equalTo(72)
        }
        
        editBtn.snp.makeConstraints { make in
            make.top.equalTo(self.selfTalkBtn)
            make.leading.equalTo(selfTalkBtn.snp.trailing).inset(0)
            make.width.equalTo(96)
            make.height.equalTo(72)
        }
        
        storyBtn.snp.makeConstraints { make in
            make.top.equalTo(self.selfTalkBtn)
            make.leading.equalTo(editBtn.snp.trailing).inset(0)
            make.width.equalTo(96)
            make.height.equalTo(72)
        }
    }
    
    @objc
    private func friendTabBackButton(){
        self.dismiss(animated: true)
    }
}

// addSubviews
extension UIView {
    func addSubviews(_ views: [UIView]){
        for view in views{
            self.addSubview(view)
        }
    }
}
