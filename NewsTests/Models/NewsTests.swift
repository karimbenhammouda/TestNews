//
//  NewsTests.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 28/01/2025.
//

import XCTest
@testable import News

class ProductsListTests: XCTestCase {
    func testNews() {
        let source = Source(id: "1", name: "Google News (France)")
        let news = News(source: source, author: "Google", title: "France", description: "Informations complètes et à jour,", url: "https://news.google.com", urlToImage: "https://news.google.com", publishedAt: "", content: "Toute l'actualité économique, financière et boursière française et internationale sur Les Echos.fr")

        XCTAssertEqual("1", news.source?.id)
        XCTAssertEqual("Google News (France)", news.source?.name)
        XCTAssertEqual("Google", news.author)
        XCTAssertEqual("France", news.title)
        XCTAssertEqual("Informations complètes et à jour,", news.description)
        XCTAssertEqual("https://news.google.com", news.url)
        XCTAssertEqual("https://news.google.com", news.urlToImage)
        XCTAssertEqual("", news.publishedAt)
        XCTAssertEqual("Toute l'actualité économique, financière et boursière française et internationale sur Les Echos.fr", news.content)
    }
}
