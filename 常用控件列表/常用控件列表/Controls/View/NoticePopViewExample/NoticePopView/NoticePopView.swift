//
//  NoticePopView.swift
//  SJZN_CHD.Project
//
//  Created by Herbert Hu on 2021/9/8.
//

// Dependent Category Classes:
// 1) Swift_Categories/Extension+UIButton ,
// 2) Swift_Categories/Extension+UIView .

import UIKit

class NoticePopWidget_DataModel {
    
    var topText: String? = "罗湖棚改注销须知"
    var middleText: String? = ""
    var buttonText: String? = "同意须知并注销"
    var excuteCustomStyleMethod = UIButton.customDarkGreenStyle
}

protocol NoticePopViewProtocol {
    
    func userHasAgreeTheAgreementProtocol(in protocolView: NoticePopView)
}

class NoticePopView: UIView {

    @IBOutlet var topTitleLabel: UILabel!
    @IBOutlet var bgView: UIView!
    @IBOutlet var tipView: UIView!
    @IBOutlet var protcolContentTextView: UITextView!
    @IBOutlet var agreeBtn: UIButton!
    @IBOutlet var tipViewCenterYConstraint: NSLayoutConstraint!
    
    private var dataModel = NoticePopWidget_DataModel()
    
    var delegate: NoticePopViewProtocol?
    
    class func loadFromNib<T: NoticePopViewProtocol>(withDelegate delegate: T) -> NoticePopView {
        let instance = (Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! NoticePopView)
        instance.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        instance.delegate = delegate
        return instance
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.topTitleLabel.text = dataModel.topText
        self.agreeBtn.setTitle(dataModel.buttonText, for: .normal)
        dataModel.excuteCustomStyleMethod(self.agreeBtn)()
        self.tipViewCenterYConstraint.constant = -(UIScreen.main.bounds.height/2.0 + self.frame.size.height + 10)
        excuteAppearAnimation()
    }
    
    func excuteAppearAnimation() {
        
        bgView.backgroundColor = UIColor.clear
        tipView.isHidden = true
        UIView.animate(withDuration: 0.4) {
            
            self.bgView.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
            
        } completion: { bool in
            
            self.tipViewCenterYConstraint.constant = 0
            self.tipView.isHidden = false
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2.0, options: .curveEaseInOut) {
                
                self.layoutIfNeeded()
                
            } completion: { finish in
                
            }
        }
    }
    
    func excuteDisAppearAnimation(closure:@escaping () -> Void) {
        
        self.tipViewCenterYConstraint.constant = -(UIScreen.main.bounds.height/2.0 + self.tipView.frame.size.height/2.0)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 1.0, options: .curveEaseIn) {
            
            self.layoutIfNeeded()
            
        } completion: { finish in
            
            UIView.animate(withDuration: 0.2) {
                
                self.bgView.backgroundColor = UIColor.clear
                
            } completion: { bool in
                
                closure()
            }
        }
    }
    
    @IBAction func agreeBtnClicked(_ sender: UIButton) {
     
        excuteDisAppearAnimation { [self] in
            if let _ = self.delegate {
                delegate?.userHasAgreeTheAgreementProtocol(in: self)
            }
        }
    }
}
