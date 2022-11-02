//
//  FriendListTableViewCell.swift
//  Assignment_Kakao
//
//  Created by KJ on 2022/10/28.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class FriendListTableViewCell: UITableViewCell {
    
    static let identifier = "FriendListTableViewCell"
    
    private let friendContainerView = UIView()
    private let friendImageView = UIImageView()
    private let friendNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    private let stateMessage = UILabel().then {
        $0.textColor = 0x1E1E1E.color
        $0.font = .systemFont(ofSize: 11, weight: .light)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init (coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

extension FriendListTableViewCell {
    private func layout(){
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [friendContainerView, friendImageView, friendNameLabel, stateMessage].forEach{
            contentView.addSubview($0)
        }
        
        friendContainerView.addSubview(friendImageView)
        friendContainerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(60)
        }
        
        friendImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(40)
        }
        
        friendNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(friendContainerView.snp.trailing).offset(11)
        }
        
        stateMessage.snp.makeConstraints { make in
            make.top.equalTo(friendNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(friendNameLabel)
        }
    }
    
    func dataBind(model: FriendModel){
        friendNameLabel.text = model.profileName
        stateMessage.text = model.stateMessage
        friendImageView.image = UIImage(named: model.profileImage)
    }
}
