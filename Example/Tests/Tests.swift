//
//  SwiftMimeTests.swift
//  SwiftMimeTests
//
//  Created by di wu on 2/9/15.
//  Copyright (c) 2015 di wu. All rights reserved.
//

import UIKit
import XCTest
import SwiftMime

class SwiftMimeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLookupType() {
        XCTAssertEqual(SwiftMime.mime("txt"), "text/plain", "pass")
    }
    
    func testLookupExtension() {
        XCTAssertEqual(SwiftMime.ext("application/atom+xml"), "atom", "pass")
    }
}
