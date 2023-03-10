//
//  ApClient.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation
import Alamofire
class ApClient: ApiProtocol {
    /// it's like singleton
    static let shared: ApClient = ApClient()
    
    /// this function permit to get the last news
    /// - parameters:
    ///    - completionHandler: callback with the result of API
    func getHeadLine(completionHandler: @escaping (AFDataResponse<Result>) -> Void) {
        makeRequest(request: ApiRouter.getTopHeadLine, completionHandler: completionHandler)
    }
    
    /// this function permit to get the dayly news but it's its funny for displaying
    /// - parameters:
    ///    - completionHandler: callback with the result of API
    func getNewsOfThisDay(completionHandler: @escaping (AFDataResponse<Result>) -> Void) {
        makeRequest(request: ApiRouter.getEverthings, completionHandler: completionHandler)
    }
    
    /// this function permit to get the news key word
    /// - parameters:
    ///    - completionHandler: callback with the result of API
    func getNewsWithThisSearch(text: String, completionHandler: @escaping (AFDataResponse<Result>) -> Void) {
        makeRequest(request: ApiRouter.getArticleWithSearchText(text), completionHandler: completionHandler)
    }
    
    /// this function it's common
    /// - parameters:
    ///    - request: request with the good endpoint
    ///    - completionHandler: callback with the result of API
    private func makeRequest(request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<Result>) -> Void) {
        AF.request(request).responseDecodable(of: Result.self) { response in
            debugPrint(response)
            completionHandler(response)
        }
    }
}
