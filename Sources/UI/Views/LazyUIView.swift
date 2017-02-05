//
//  UIView.swift
//  iOSSwiftSand
//
//  Created by Vladas Zakrevskis on 2/1/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit

public extension UIView {
    
    //MARK: - Static methods
    
    static let dummyTag = "dummy".hash
    
    static var dummy:UIView {
        
        let dummy = UIView(CGRect(0, 0, 100, 100))
        dummy.backgroundColor = UIColor.random
        dummy.tag = dummyTag
        return dummy
    }
    
    //MARK: - Initializators

    convenience init(_ frame:CGRect) {
        
        self.init(frame:frame)
    }
    
    convenience init(_ x:CGFloat, _ y:CGFloat, _ width:CGFloat, _ height:CGFloat) {
        
        self.init(frame:CGRect(x, y, width, height))
    }
    
    convenience init(width:CGFloat, height:CGFloat) {
        
        self.init(CGRect(0, 0, width, height))
    }
    
    //MARK: - Geometry
    
    var width:CGFloat {
        
        get {
            
            return self.frame.size.width
        }
        set {
            
            var frame = self.frame
            frame.width = newValue
            self.frame = frame
        }
    }
    
    var height:CGFloat {
        
        get {
            
            return self.frame.size.height
        }
        set {
            
            var frame = self.frame
            frame.height = newValue
            self.frame = frame
        }
    }
    
    var x:CGFloat {
        
        get {
            
            return self.frame.origin.x
        }
        set {
            
            var frame = self.frame
            frame.x = newValue
            self.frame = frame
        }
    }
    
    var y:CGFloat {
        
        get {
            
            return self.frame.origin.y
        }
        set {
            
            var frame = self.frame
            frame.y = newValue
            self.frame = frame
        }
    }
    
    func set(width:CGFloat, height:CGFloat) {
        
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
    
    func horizontalCenterInSuperview() {
        
        if let superview = self.superview {
            
            var frame = self.frame
            frame.x = superview.width / 2 - self.width / 2
            self.frame = frame
        }
    }
    
    func verticalCenterInSuperview() {
        
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
    
    //MARK: - Other
    
    func removeDummies() {
        
        for view in self.subviews {
            if view.tag == UIView.dummyTag {
                view.removeFromSuperview()
            }
        }
    }
}
