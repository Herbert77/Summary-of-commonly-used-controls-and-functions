//
//  Extension+UIButton.swift
//  SJZN_CHD.Project
//
//  Created by Herbert Hu on 2021/8/25.
//

import UIKit

extension UIButton {
    
    public func customDarkGreenStyle() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        self.backgroundColor = UIColor(red: 0.0, green: 164.0/255.0, blue: 104.0/255.0, alpha: 1.0)
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.5
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.lightGray, for: .highlighted)
    }
    
    //新增红色样式:
    public func customDarkRedStyle() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        self.backgroundColor = UIColor(red: 223/255.0, green: 61/255.0, blue: 56/255.0, alpha: 1.0)
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.5
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.lightGray, for: .highlighted)
    
    }
    
    public func customWarningRedStyle() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        self.backgroundColor = UIColor(red: 232/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1.0)
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.5
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.lightGray, for: .highlighted)
    }
}

