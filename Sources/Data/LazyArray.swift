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
}

public extension Array where Element:Equatable {
    
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
}

