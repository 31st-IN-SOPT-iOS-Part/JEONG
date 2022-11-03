//
//  GalleryViewController.swift
//  Assignment_Kakao
//
//  Created by KJ on 2022/11/03.
//

import UIKit

class GalleryViewController: UIViewController {
    
    private let closeImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "iconClose")
        return imgView
    }()
    
    private let recentLabel: UILabel = {
        let label = UILabel()
        label.text = "최근항목"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let sendLabel: UILabel = {
        let label = UILabel()
        label.text = "전송"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var galleryCollectionView: UICollectionView = {
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
    
    var PhotoList: [PhotoModel] = [
        PhotoModel(photoImage: "galleryImage1"),
        PhotoModel(photoImage: "galleryImage2"),
        PhotoModel(photoImage: "galleryImage3"),
        PhotoModel(photoImage: "galleryImage4"),
        PhotoModel(photoImage: "galleryImage5"),
        PhotoModel(photoImage: "galleryImage6"),
        PhotoModel(photoImage: "galleryImage7"),
        PhotoModel(photoImage: "galleryImage8"),
        PhotoModel(photoImage: "galleryImage9"),
        PhotoModel(photoImage: "galleryImage10"),
        PhotoModel(photoImage: "galleryImage11"),
        PhotoModel(photoImage: "galleryImage12"),
        PhotoModel(photoImage: "galleryImage13"),
        PhotoModel(photoImage: "galleryImage14"),
        PhotoModel(photoImage: "galleryImage15"),
        PhotoModel(photoImage: "galleryImage16"),
        PhotoModel(photoImage: "galleryImage17"),
        PhotoModel(photoImage: "galleryImage18"),
        PhotoModel(photoImage: "galleryImage19"),
        PhotoModel(photoImage: "galleryImage20"),
        PhotoModel(photoImage: "galleryImage21"),
        PhotoModel(photoImage: "galleryImage22"),
        PhotoModel(photoImage: "galleryImage23"),
    ]
    
    final let photoInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
    final let photoLineSpacing: CGFloat = 7
    final let photoInterItemSpacing: CGFloat = 9
    final let photoCellHeight = 119


    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        layout()
    }
}

extension GalleryViewController {
    private func layout() {
        view.backgroundColor = .white
        view.addSubviews([closeImg, recentLabel, sendLabel, galleryCollectionView])
        
        closeImg.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(7)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(12)
        }
        
        recentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(11)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        sendLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(11)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(10)
        }
        
        galleryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recentLabel.snp.bottom).offset(11)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    
    private func register() {
        galleryCollectionView.register(GalleryCollectionViewCell.self,
                                       forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier
        )
    }
}

extension GalleryViewController: UICollectionViewDelegate {

}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath)
                as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        photoCell.dataBind(model: PhotoList[indexPath.item])
        return photoCell
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let CellWidth = screenWidth - photoInset.left - photoInset.right - photoInterItemSpacing * 3
        return CGSize(width: CellWidth / 3, height: 119)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return photoLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return photoInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return photoInset
    }
}
