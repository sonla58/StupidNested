//
//  NestedChecker.swift
//  NestedChecker
//
//  Created by Anh Son Le on 10/4/18.
//  Copyright © 2018 Anh Son Le. All rights reserved.
//

import Foundation

public class NestedChecker {
    
    /// Singleton of nestchecker
    public static let shared = NestedChecker()
    
    // MARK: - Define
    
    var startNestedSet = ["(", "<", "[", "{"]
    var endNestedSet = [")", ">", "]", "}"]
    
    var startStack: [String] = []
    
    public func check(str: String) -> Bool {
        startStack = []
        for i in 0..<str.count {
            let index = str.index(str.startIndex, offsetBy: i)
            let currentCharacter = String(str[index])
            if startNestedSet.contains(currentCharacter) {
                startStack.append(currentCharacter)
            } else {
                if endNestedSet.firstIndex(of: currentCharacter) != startNestedSet.firstIndex(of: startStack.last ?? "") {
                    print("no phai nested")
                    return false
                } else {
                    _ = startStack.popLast()
                }
            }
        }
        return startStack.isEmpty
    }
    
}
