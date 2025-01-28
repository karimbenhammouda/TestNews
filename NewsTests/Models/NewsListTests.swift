//
//  NewsListTests.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 28/01/2025.
//

import XCTest
@testable import News

class NewsListTests: XCTestCase {
    func testNewsList() {
        let source = Source(id: "1", name: "Google News (France)")
        let news = News(source: source, author: "Google", title: "France", description: "Informations complètes et à jour,", url: "https://news.google.com", urlToImage: "https://news.google.com", publishedAt: "", content: "Toute l'actualité économique, financière et boursière française et internationale sur Les Echos.fr")
        
        let newsList = NewsList(status: "ok", articles: [news])
        XCTAssertEqual("ok", newsList.status)
        XCTAssertEqual("1", newsList.articles[0].source?.id)
        XCTAssertEqual("Google News (France)", newsList.articles[0].source?.name)
        XCTAssertEqual("Google", newsList.articles[0].author)
        XCTAssertEqual("France", newsList.articles[0].title)
        XCTAssertEqual("Informations complètes et à jour,", newsList.articles[0].description)
        XCTAssertEqual("https://news.google.com", newsList.articles[0].url)
        XCTAssertEqual("https://news.google.com", newsList.articles[0].urlToImage)
        XCTAssertEqual("", newsList.articles[0].publishedAt)
        XCTAssertEqual("Toute l'actualité économique, financière et boursière française et internationale sur Les Echos.fr", newsList.articles[0].content)
    }
}
