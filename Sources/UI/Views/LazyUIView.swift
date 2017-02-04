//
//  UIView.swift
//  iOSSwiftSand
//
//  Created by Vladas Zakrevskis on 2/1/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit

public extension UIView {
    
    static let dummyTag = "dummy".hash
    
    static var dummy:UIView {
        
        let dummy = UIView(CGRect(0, 0, 100, 100))
        dummy.backgroundColor = UIColor.random
        dummy.tag = dummyTag
        return dummy
    }
    
    convenience init(_ frame:CGRect) {
        
        self.init(frame:frame)
    }
    
    func removeDummies() {
        
        for view in self.subviews {
            if view.tag == UIView.dummyTag {
                view.removeFromSuperview()
            }
        }
    }
    
    var width:CGFloat {
        
        get {
            
            return self.frame.size.width
        }
        set {
            
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var height:CGFloat {
        
        get {
            
            return self.frame.size.height
        }
        set {
            
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
}
