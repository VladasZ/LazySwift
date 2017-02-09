//
//  Misc.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/8/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import Foundation

func countryName(from countryCode: String) -> String {
    
    if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode) {
        return name
    }
    else {
        return countryCode
    }
}