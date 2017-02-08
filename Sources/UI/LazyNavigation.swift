//
//  LazyNavigation.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/8/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit

public func presentViewController(_ controller:UIViewController, animated:Bool = true) {
    
    var topController = UIApplication.shared.keyWindow?.rootViewController
    
    while((topController!.presentedViewController) != nil) {
        topController = topController!.presentedViewController
    }
    
    topController?.present(controller, animated: animated, completion: nil)
}
