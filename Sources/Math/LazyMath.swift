//
//  MathMisc.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/4/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import Foundation

@inline(__always)
public func random() -> Int {
    
    return Int(arc4random())
}

@inline(__always)
public func random(_ uniform:Int) -> Int {
    
    return Int(arc4random_uniform(UInt32(uniform)))
}

@inline(__always)
public func randomBool() -> Bool {
    
    return random() % 2 == 0
}
