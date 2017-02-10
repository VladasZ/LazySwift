//
//  LazyNavigation.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/8/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit

public extension Lazy {
    
    public static var topmostController:UIViewController?
    {
        var topController = UIApplication.shared.keyWindow?.rootViewController;
        
        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController;
        }
        
        return topController
    }
    
    public static var keyWindow:UIView {
        
        return UIApplication.shared.keyWindow as! UIView
    }
    
    public static func presentViewController(_ controller:UIViewController, animated:Bool = true) {
        
        topmostController?.present(controller, animated: animated, completion: nil)
    }
}


