//
//  String+UtilesTest.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 28/01/2025.
//

import XCTest
import Foundation
@testable import News

class StringUtilesTest: XCTestCase {
    func testStringFormatter() {
        let dateString = "2025-01-16T11:00:00Z"
        let dateFormatShort = dateString.dateFormatter(dateString: dateString, style: .short)
        XCTAssertEqual("16/01/2025", dateFormatShort!)
        let dateFormatMedium = dateString.dateFormatter(dateString: dateString, style: .medium)
        XCTAssertEqual("16 janv. 2025", dateFormatMedium!)
        let dateFormatLong = dateString.dateFormatter(dateString: dateString, style: .long)
        XCTAssertEqual("16 janvier 2025", dateFormatLong!)
        let dateFormatFull = dateString.dateFormatter(dateString: dateString, style: .full)
        XCTAssertEqual("jeudi 16 janvier 2025", dateFormatFull!)
    }
}
