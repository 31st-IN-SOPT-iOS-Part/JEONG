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
        label.numberOfLines = 2 // 줄 수 2개
        return label
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black , for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 5 // 버튼 모서리 둥글게
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
        return button
    }()
    
    var result: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(nameLabel)
        view.addSubview(checkButton)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(241)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(144)
            make.height.equalTo(60)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(117)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            make.height.equalTo(44)
        }
    }
    
    func dataBind(){
        guard let result = self.result else { return }
        nameLabel.text = "\(result)님 \n 환영합니다"
    }
    
    @objc
    private func touchupBackButton(){
        if self.navigationController == nil{
            self.dismiss(animated: true, completion: nil)
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }
}
