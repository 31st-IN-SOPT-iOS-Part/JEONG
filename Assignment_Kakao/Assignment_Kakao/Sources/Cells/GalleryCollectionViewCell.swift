//
//  GalleryCollectionViewCell.swift
//  Assignment_Kakao
//
//  Created by KJ on 2022/11/03.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GalleryCollectionViewCell"
    
    private let galleryContainerView = UIView()
    private let galleryImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryCollectionViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [galleryContainerView, galleryImageView].forEach {
            contentView.addSubview($0)
        }
        
        galleryContainerView.addSubview(galleryImageView)
        galleryContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        galleryImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func dataBind(model: PhotoModel) {
        galleryImageView.image = UIImage(named: model.photoImage)
    }
}
