//
//  NestedCheckerTests.swift
//  NestedCheckerTests
//
//  Created by Anh Son Le on 10/4/18.
//  Copyright © 2018 Anh Son Le. All rights reserved.
//

import XCTest
@testable import NestedChecker

class NestedCheckerTests: XCTestCase {
    
    // MARK: - Define some test case
    
    var testCaseTrue: [String] = [
        "",
        "(<>(<[[](<(()(<>))>)]>)[][()][(<>)])()",
        "()<>{}[]"
        ]
    
    var testCaseFalse: [String] = [
        "}",
        "(<>(<[[](<(()(<>))>))]>)[][()][(<>)])()",
        "(<>(<[[](<(()(<>))>)]>)[][()][(<>)])()<>[]]"
    ]
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testNestedChecker() {
        for str in testCaseTrue {
            XCTAssertTrue(NestedChecker.shared.check(str: str))
        }
        for str in testCaseFalse {
            XCTAssertFalse(NestedChecker.shared.check(str: str))
        }
    }
    
}
