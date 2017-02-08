//
//  ViewsMisc.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/4/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit


func viewNamed(_ nibName: String, bundle : Bundle? = nil) -> UIView? {
    
    return UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
}

public var keyWindow:UIView {
    
    return UIApplication.shared.keyWindow as! UIView
}
