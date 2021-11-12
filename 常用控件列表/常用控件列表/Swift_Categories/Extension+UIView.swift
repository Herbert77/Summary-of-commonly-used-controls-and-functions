//
//  Extension+UIView.swift
//
//  Created by Mac Pro on 2020/6/1.
//  Copyright © 2020 CHENNIAN. All rights reserved.
//

import UIKit
extension UIView {
    
    public var x: CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    
    public var y: CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    public var rightX: CGFloat{
        get{
            return self.x + self.width
        }
        set{
            var r = self.frame
            r.origin.x = newValue - frame.size.width
            self.frame = r
        }
    }
    public var bottomY: CGFloat{
        get{
            return self.y + self.height
        }
        set{
            var r = self.frame
            r.origin.y = newValue - frame.size.height
            self.frame = r
        }
    }
    
    public var centerX : CGFloat{
        get{
            return self.center.x
        }
        set{
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    public var centerY : CGFloat{
        get{
            return self.center.y
        }
        set{
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    public var width: CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var r = self.frame
            r.size.width = newValue
            self.frame = r
        }
    }
    public var height: CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var r = self.frame
            r.size.height = newValue
            self.frame = r
        }
    }
    
    
    public var origin: CGPoint{
        get{
            return self.frame.origin
        }
        set{
            self.x = newValue.x
            self.y = newValue.y
        }
    }
    
    public var size: CGSize{
        get{
            return self.frame.size
        }
        set{
            self.width = newValue.width
            self.height = newValue.height
        }
    }
    public var topValue: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = y
            self.frame = frame
        }
    }
    
    func screenViewYValue() -> CGFloat {
        var y:CGFloat = 0
        var supView: UIView = self
        while let view = supView.superview {
            y += view.frame.origin.y
            if let scrollView = view as? UIScrollView {
                y -= scrollView.contentOffset.y
            }
            supView = view
        }
        return y
    }
    
    func addCorner(roundingCorners: UIRectCorner, cornerSize: CGSize) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: cornerSize)
        let cornerLayer = CAShapeLayer()
        cornerLayer.frame = bounds
        cornerLayer.path = path.cgPath
        
        layer.mask = cornerLayer
    }
    
    public func addSubviews(views: [UIView]) {
        
        for v in views {
            self.addSubview(v)
        }
        
    }
    
    public enum CommonShadowDirection {
        case directionUp
        case directionDown
    }
    
    public func setCommonShadow(withShadowDirection direction:CommonShadowDirection? = .directionDown) {
        
        var offset_height = 2.0
        if direction == .directionUp {
            offset_height = -(offset_height)
        }
        
        let layerView = self
        // shadowCode
        layerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        layerView.layer.shadowOffset = CGSize(width: 0, height: offset_height)
        layerView.layer.shadowOpacity = 0.2
        layerView.layer.shadowRadius = 3.5
    }
    
    func setRoundedStyle() {
        self.layer.cornerRadius = self.width/2.0
    }
}
