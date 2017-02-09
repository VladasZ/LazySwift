//
//  LazyString.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/9/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import Foundation

public extension String {
    
    var firstLetter:String {
        
        return String(characters.prefix(1))
    }
}
