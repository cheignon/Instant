//
//  ApiRouter.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    case getTopHeadLine
    case getEverthings
    case getArticleWithSearchText(String)
    
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2")!
    }
    
    var language: String {
        return "fr"
    }
    
    var contryParameter: String {
        return "country"
    }
    
    var languageParameter: String {
        return "language"
    }
    
    /// It's a test so don't kill me please
    ///  what i do normaly i put on the bundle or CI/CD config and setup
    ///  why the bundle ? because its impossiblee to change it after the build
    ///  and what i do a normally i encrypt it with the sipher and I put the de decypher online like that
    ///  if you a issue on security the user data don't be steal ( firebase do that ) look on gpg encrypt
    var apiKeyParameter: String {
        return "apiKey"
    }
    
    
    /// never to that !!!!! the reverserce enginering can get that  put on info.plists or what ever but don't do like me
    var apiKey: String {
        return "d47429eec6d74945b9de03dc8cd9c9ef"
    }
    
    var method: HTTPMethod {
        switch self {
        case .getTopHeadLine,
                .getEverthings,
            .getArticleWithSearchText:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getTopHeadLine:
            return "/top-headlines"
        case .getEverthings, .getArticleWithSearchText:
            return "/everything"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var url = baseURL.appendingPathComponent(path)
        
        var dictionnaryParametters = [String: String]()
        dictionnaryParametters[apiKeyParameter] = apiKey
        switch self {
        case .getArticleWithSearchText( let searchTexxt) :
            dictionnaryParametters["q"] = "\(searchTexxt)"
        case .getTopHeadLine:
            dictionnaryParametters[contryParameter] = language
        case .getEverthings:
            dictionnaryParametters[languageParameter] = language
            dictionnaryParametters["q"] = "today"

            break
        }
        
        var request = URLRequest(url: url)
        request = try URLEncodedFormParameterEncoder().encode(dictionnaryParametters, into: request)
        debugPrint("[ROUTER] : url will be called is : \(request.url?.absoluteString)")
        request.method = method
        return request
    }
}
