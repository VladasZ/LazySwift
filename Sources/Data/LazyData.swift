//
//  LazyData.swift
//  SwiftLibs
//
//  Created by Vladas Zakrevskis on 5/25/17.
//  Copyright © 2017 VladasZ. All rights reserved.
//

import Foundation

public extension Data {
    
    public var JSONString: String {
        
        return String(data: self, encoding: .utf8) ?? "not a JSONString"
    }
}
