//
//  NetworkManagerTests.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 28/01/2025.
//

import XCTest
@testable import News

class NetworkManagerTests: XCTestCase {
    func testCallListsNews() {
        let sut = AllNewsNetworkManager()
        sut.getNewsList { (data)  in
            guard let data = data else {
                return
            }
            XCTAssertTrue(data.articles.count > 1, "listes des news not vide")
        }
    }
}
