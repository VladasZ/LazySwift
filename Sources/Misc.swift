//
//  Misc.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/8/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit

public class Lazy {
    
    public static func countryName(from countryCode: String) -> String {
        
        if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode) {
            return name
        }
        else {
            return countryCode
        }
    }
    
    public static func openSettings() {
        
        UIApplication.shared.openURL(NSURL(string:UIApplicationOpenSettingsURLString)! as URL)
    }
}


