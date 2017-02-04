//
//  ViewsMisc.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/4/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit

@inline(__always)
func nibNamed(_ name: String) -> UIView {
    
    return Bundle.main.loadNibNamed(name, owner: nil, options: nil)![0] as! UIView
}
