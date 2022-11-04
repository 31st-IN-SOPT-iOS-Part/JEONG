//
//  ChatCollectionViewCell.swift
//  Assignment_Kakao
//
//  Created by KJ on 2022/11/02.
//

import UIKit

final class ChatCollectionViewCell: UICollectionViewCell {
    static let identifier = "ChatCollectionViewCell"
    
    private let chatContainerView = UIView()
    private let chatImageView = UIImageView()
    private let chatNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    private let chatMessageLabel = UILabel().then {
        $0.textColor = 0x1E1E1E.color
        $0.font = .systemFont(ofSize: 11, weight : .medium)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init (coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

extension ChatCollectionViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [chatContainerView, chatImageView, chatNameLabel, chatMessageLabel].forEach {
            contentView.addSubview($0)
        }
        
        chatContainerView.addSubview(chatImageView)
        chatContainerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(60)
        }
        
        chatImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(40)
        }
        
        chatNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(chatContainerView.snp.trailing).offset(11)
        }
        
        chatMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(chatNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(chatNameLabel)
        }
    }
    
    func dataBind(model: FriendModel){
        chatNameLabel.text = model.profileName
        chatMessageLabel.text = model.stateMessage
        chatImageView.image = UIImage(named: model.profileImage)
    }
}
