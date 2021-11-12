//
//  NoticePopView_ViewController.swift
//  常用控件列表
//
//  Created by Herbert Hu on 2021/11/12.
//  Copyright © 2021 Herbert Hu. All rights reserved.
//

import UIKit

class NoticePopView_ViewController: UIViewController {

    var popView: NoticePopView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func show(_ sender: Any) {
        
        self.popView = NoticePopView.loadFromNib(withDelegate: self)
        self.popView?.protcolContentTextView.text = "123"
        UIApplication.shared.windows.first?.addSubview(self.popView!)
    }
}

// MARK: - NoticePopViewProtocol
extension NoticePopView_ViewController: NoticePopViewProtocol {
    
    func userHasAgreeTheAgreementProtocol(in protocolView: NoticePopView) {
        
        self.popView?.removeFromSuperview()
    }
}
