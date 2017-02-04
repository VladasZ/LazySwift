//
//  LazyCGRect.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/4/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit

public extension CGRect {
    
    init(_ width:CGFloat, _ height:CGFloat) {
        
        self.init(x:0, y:0, width:width, height:height)
    }
    
    init(_ x:CGFloat, _ y:CGFloat, _ width:CGFloat, _ height:CGFloat) {
        
        self.init(x:x, y:y, width:width, height:height)
    }
}
