//
//  UIView +.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/02/07.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
