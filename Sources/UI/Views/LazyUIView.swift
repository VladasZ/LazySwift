//
//  UIView.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/1/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit

public extension UIView {
    
    //MARK: - Static methods
    
    static let dummyTag = "dummy".hash
    
    static var dummy: UIView {
        
        let dummy = UIView(CGRect(0, 0, 100, 100))
        dummy.backgroundColor = UIColor.random
        dummy.tag = dummyTag
        return dummy
    }
    
    //MARK: - Initializators

    convenience init(_ frame: CGRect) {
        
        self.init(frame: frame)
    }
    
    convenience init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        
        self.init(frame:CGRect(x, y, width, height))
    }
    
    convenience init(width:CGFloat, height:CGFloat) {
        
        self.init(CGRect(0, 0, width, height))
    }
    
    //MARK: - Geometry
    
    var width: CGFloat {
        
        get { return self.frame.size.width }
        set {
            
            var frame = self.frame
            frame.width = newValue
            self.frame = frame
        }
    }
    
    var height: CGFloat {
        
        get { return self.frame.size.height }
        set {
            
            var frame = self.frame
            frame.height = newValue
            self.frame = frame
        }
    }
    
    var x: CGFloat {
        
        get { return self.frame.origin.x }
        set {
            
            var frame = self.frame
            frame.x = newValue
            self.frame = frame
        }
    }
    
    var y: CGFloat {
        
        get { return self.frame.origin.y }
        set {
            
            var frame = self.frame
            frame.y = newValue
            self.frame = frame
        }
    }
    
    func set(width: CGFloat, height: CGFloat) {
        
        var frame = self.frame
        frame.width = width
        frame.height = height
        self.frame = frame
    }
    
    //MARK: - Positioning
    
    func stickToBottom() {
        
        if let superview = self.superview {
            self.y = superview.height - self.height
        }
    }
    
    func centerInSuperview() {
        
        if let superview = self.superview {
            
            var frame = self.frame
            frame.x = superview.width / 2 - self.width / 2
            frame.y = superview.height / 2 - self.height / 2
            self.frame = frame
        }
    }
    
    func centerHorizontallyInSuperview() {
        
        if let superview = self.superview {
            
            var frame = self.frame
            frame.x = superview.width / 2 - self.width / 2
            self.frame = frame
        }
    }
    
    func centerVerticallyInSuperview() {
        
        if let superview = self.superview {
            
            var frame = self.frame
            frame.y = superview.height / 2 - self.height / 2
            self.frame = frame
        }
    }
    
    //MARK: - Subviews managing
    
    func addSubview(init:(UIView) -> ()) {
        
        let view = UIView()
        self.addSubview(view)
        `init`(view)
    }
    
    func subviewWith(tag:Int) -> UIView? {
        
        for subview in self.subviews {
            if subview.tag == tag {
                return subview
            }
        }
        
        return nil
    }
    
    func subviewOfType(_ type:UIView.Type) -> UIView? {
        
        for subview in subviews {
            if subview.isKind(of: type) {
                return subview
            }
        }
        
        return nil
    }
    
    //MARK: - Animation
    
    class func animate(withDuration duration: TimeInterval, _ animations: @escaping @autoclosure () -> Void) {
        
        UIView.animate(withDuration: duration, animations: animations)
    }
    
    //MARK: - Other
    
    func withColor(_ color:UIColor) -> Self {
        
        backgroundColor = color
        return self
    }
    
    func withColor(_ r:Int, _ g:Int, _ b:Int) -> Self {
        
        return self.withColor(UIColor(r, g, b))
    }
    
    func withFrame(_ frame:CGRect) -> Self {
        
        self.frame = frame
        return self
    }
    
    func withFrame(_ x:CGFloat, _ y:CGFloat, _ width:CGFloat, _ height:CGFloat) -> Self {
        
        return self.withFrame(CGRect(x, y, width, height))
    }
    
    @discardableResult func circle() -> Self {
        
        clipsToBounds = true
        layer.cornerRadius = height / 2
        
        return self
    }
    
    func removeDummies() {
        
        for view in self.subviews {
            if view.tag == UIView.dummyTag {
                view.removeFromSuperview()
            }
        }
    }
    
    func makeHoleAtCenterWithRadius(_ radius: CGFloat) {
        
        let holeFrame = CGRect(frame.size.width / 2 - radius,
                               frame.size.height / 2 - radius,
                               radius * 2,
                               radius * 2)
        
        makeHoleAt(holeFrame)
    }
    
    func makeHoleAt(_ rect: CGRect) {
        
        let backgroundPath = UIBezierPath(rect: frame)
        let circlePath     = UIBezierPath(ovalIn: rect)
        
        circlePath.append(backgroundPath)
        
        let mask = CAShapeLayer()
        mask.path = circlePath.cgPath
        mask.fillRule = kCAFillRuleEvenOdd
        self.layer.mask = mask
    }
}


