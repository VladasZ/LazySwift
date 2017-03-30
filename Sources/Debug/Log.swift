//
//  Log.swift
//  SwiftLibs
//
//  Created by Vladas Zakrevskis on 3/30/17.
//  Copyright © 2017 VladasZ. All rights reserved.
//

import Foundation

fileprivate enum LogType {
    
    case info
    case warning
    case error
}


public extension Lazy {
    
    public struct log {
        
        public static func info(_ message:String = "", _ file:String = #file, _ function:String = #function, _ line:Int = #line) {
            
            log(message, withType: .info, file, function, line)
        }
        
        public static func warning(_ message:String, _ file:String = #file, _ function:String = #function, _ line:Int = #line) {
            
            log(message, withType: .warning, file, function, line)
        }
        
        public static func error(_ message:String = "", _ file:String = #file, _ function:String = #function, _ line:Int = #line) {
            
            log(message, withType: .error, file, function, line)
        }
        
        private static func log(_ message:String, withType type:LogType, _ file:String, _ function:String, _ line:Int) {
            
            #if DEBUG
                
                var typeString: String
                let file = file.lastPathComponent.replacingOccurrences(of: ".swift", with: "")
                
                switch type {
                case .info:    typeString = "💚 INFO 💚"
                case .warning: typeString = "💛 WARNING 💛"
                case .error:   typeString = "❤️ ERROR ❤️"
                }
                
                var logMessage = "[\(typeString)]"
                
                logMessage.append("[\(file)::\(function) - \(line)]")
                logMessage.append(" \(message)")
                
                print(logMessage)
                
            #endif
        }
    }
}
