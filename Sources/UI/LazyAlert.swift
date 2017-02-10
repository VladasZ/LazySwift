//
//  LazyAlert.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/10/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit


public extension Lazy {
    
    public struct alert {
        
        public static var cancelLabel:String = "Cancel"
        public static var agreeLabel:String = "OK"
        public static var errorLabel:String = "Error"
        
        public static func show(_ message:String) {
            
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: agreeLabel, style: .default, handler: nil))
            
            topmostController?.present(alert, animated: true, completion: nil)
        }
        
        public static func error(_ message:String) {
            
            let alert = UIAlertController(title: errorLabel, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: agreeLabel, style: .default, handler: nil))
            topmostController?.present(alert, animated: true, completion: nil)
        }
        
        public static func question(_ message:String, agreeTitle:String, action:@escaping () -> ()) {
            
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: cancelLabel, style: .destructive, handler: nil))
            alert.addAction(UIAlertAction(title: agreeTitle, style: .default, handler: { al in action() }))
            topmostController?.present(alert, animated: true, completion: nil)
        }
    }
}
