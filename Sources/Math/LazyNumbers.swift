//
//  LazyNumbers.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/4/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit

public extension Int {
    
    var CGFloat: CGFloat { return CoreGraphics.CGFloat(self) }
    var Double: Double   { return Swift.Double(self) }
    var String: String   { return Swift.String(self) }
}

public extension Double {
    
    var CGFloat: CGFloat { return CoreGraphics.CGFloat(self) }
    var Int: Int         { return Swift.Int(self) }
    var String: String   { return Swift.String(self) }
}

public extension CGFloat {
    
    var Double: Double   { return Swift.Double(self) }
    var Int: Int         { return Swift.Int(self) }
    var String: String   { return Swift.String(describing: self) }
}
