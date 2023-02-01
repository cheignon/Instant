//
//  Result.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation


// MARK: - Result
class Result: Codable {
    var status: String
    var totalResults: Int?
    var articles: [Article]?
    var message: String?
    var code: String?

    init(status: String, totalResults: Int?, articles: [Article]?, message: String?, code: String?) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
    
    func getCountOfArticles() -> Int {
        guard let articles = self.articles else {
            return 0
        }
        return articles.count
    }
}

extension Result: Equatable {
    static func == (lhs: Result, rhs: Result) -> Bool {
        return lhs.status == rhs.status && lhs.totalResults == rhs.totalResults && rhs.articles == lhs.articles
    }
}
