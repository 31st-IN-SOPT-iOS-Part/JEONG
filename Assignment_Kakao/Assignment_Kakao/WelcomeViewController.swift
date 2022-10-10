//
//  WelcomeViewController.swift
//  1st_Assignment
//
//  Created by KJ on 2022/10/07.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 175, y: 270, width: 100, height: 30))
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 155, y: 310, width: 100, height: 30))
        label.text = "환영합니다"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 450, width: 350, height: 40))
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

        let components: [Any] = [nameLabel, welcomeLabel, checkButton]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
    }
    
    func dataBind(){
        guard let result = self.result else { return }
        nameLabel.text = "\(result)님"
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
