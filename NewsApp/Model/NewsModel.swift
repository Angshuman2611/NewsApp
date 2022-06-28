//
//  NewsModel.swift
//  NewsApp
//
//  Created by Angshuman Das on 07/04/1401 AP.
//

import Foundation

// MARK: - HomeFeedModel
struct NewsModel: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    var source: Source?
    var author, title, articleDescription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt, content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    var id, name: String?
}
