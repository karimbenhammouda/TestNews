//
//  NewsList.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import Foundation

struct NewsList: Decodable {
    let status: String?
    let articles: [News]
}
