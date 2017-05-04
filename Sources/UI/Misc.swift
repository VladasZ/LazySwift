//
//  Misc.swift
//  SwiftLibs
//
//  Created by Vladas Zakrevskis on 5/4/17.
//  Copyright © 2017 VladasZ. All rights reserved.
//

import Foundation

public func after(_ delay: Double, action: @escaping () -> ()) {
    
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: action)
}
