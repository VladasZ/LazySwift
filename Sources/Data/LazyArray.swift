//
//  File.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/7/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import Foundation

public extension Array {
    
    func find(_ isIncluded:(Element) throws -> Bool) -> Element? {
        
        do {
            
            return try self.filter(isIncluded).first
        }
        catch {
            
            return nil
        }
    }
    
    func enumerate(_ enumerate:(Element) -> ()) {
        
        for element in self {
            
            enumerate(element)
        }
    }
}
