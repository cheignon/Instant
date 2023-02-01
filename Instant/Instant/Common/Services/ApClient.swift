//
//  ApClient.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation
import Alamofire
class ApClient: ApiProtocol {
    
    static let shared: ApClient = ApClient()
    
    func getHeadLine(completionHandler: @escaping (AFDataResponse<Result>) -> Void) {
        makeRequest(request: ApiRouter.getTopHeadLine, completionHandler: completionHandler)
    }
    
    func getNewsOfThisDay(completionHandler: @escaping (AFDataResponse<Result>) -> Void) {
        makeRequest(request: ApiRouter.getEverthings, completionHandler: completionHandler)
    }
    
    func getNewsWithThisSearch(text: String, completionHandler: @escaping (AFDataResponse<Result>) -> Void) {
        makeRequest(request: ApiRouter.getArticleWithSearchText(text), completionHandler: completionHandler)
    }
    
    private func makeRequest(request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<Result>) -> Void) {
        AF.request(request).responseDecodable(of: Result.self) { response in
            debugPrint(response)
            completionHandler(response)
        }
    }
}
