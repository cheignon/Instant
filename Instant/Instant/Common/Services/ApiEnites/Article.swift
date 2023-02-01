//
//  Article.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation

// MARK: - Article
class Article: Codable {
    var source: Source
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String?
    var content: String?

    init(source: Source, author: String?, title: String, description: String?, url: String, urlToImage: String?, publishedAt: String?, content: String?) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
}
