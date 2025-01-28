//
//  SourceTests.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 28/01/2025.
//

import XCTest
@testable import News

class SourceTests: XCTestCase {
    func testSource() {
        let source = Source(id: "1", name: "Google News (France)")

        XCTAssertEqual("1", source.id)
        XCTAssertEqual("Google News (France)", source.name)
    }
}
