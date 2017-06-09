//
//  LazyString.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/9/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import Foundation

public extension String {
    
    private static let letters = ["a", "b", "c", "d", "e", "f", "g", "i", "j", "k", "l", "m",
                                  "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    public static var randomWord: String {
        
        var string = ""
        for _ in 0...random(8) { string.append(letters[random(letters.count)]) }
        return string
    }
    
    public static var randomSentence: String {
        
        var string = String.randomWord
        for _ in 0...random(40) { string.append(" \(String.randomWord)") }
        return string
    }

    public var firstLetter: String {
        
        return String(characters.prefix(1))
    }
    
    public var lastPathComponent:String {
        
        return URL(string:self)!.lastPathComponent
    }
    
    public func insert(string: String, at ind: Int) -> String {
        
        return  String(self.characters.prefix(ind)) + string + String(self.characters.suffix(self.characters.count - ind))
    }
    
    private static let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    public var isNumeric: Bool {
        guard self.characters.count > 0 else { return false }
        return Set(self.characters).isSubset(of: String.nums)
    }
    
    
    public var withoutLetters: String {
        
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }

    public func remove(_ characters: String) -> String {
        
        return components(separatedBy: CharacterSet(charactersIn: characters)).joined()
    }

}



