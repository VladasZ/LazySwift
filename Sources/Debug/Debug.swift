//
//  Debug.swift
//  SwiftLibs
//
//  Created by Vladas Zakrevskis on 3/30/17.
//  Copyright © 2017 VladasZ. All rights reserved.
//

import Foundation


public extension Lazy {
    
    public struct debug {
        
        public static func execute(_ block: () -> ()) {
            
            #if DEBUG
                block()
            #endif
        }
        
        public static func executeInDebug(_ debug: () -> (), release: () -> ()) {
            
            #if DEBUG
            debug()
            #else
            release()
            #endif
        }
        
        public static func executeOnSimulator(_ simulator: () -> (), device: () -> ()) {
            
            #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
                simulator()
            #else
                device()
            #endif
        }
    }
}
