//
//  InstantTests.swift
//  InstantTests
//
//  Created by dorian cheignon on 31/01/2023.
//

import XCTest
@testable import Instant

final class InstantTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModel() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let source = Source(id: "1", name: "le monde")
        let article = Article(source: source, author: "Moi", title: "une histoire", description: "BLABLA BLABLA", url: "https://www.liberation.fr/international/europe/guerre-en-ukraine-vladimir-poutine-ordonne-un-cessez-le-feu-les-6-et-7", urlToImage: "https://www.liberation.fr/resizer/4hbZgDs3me2FBbXN_iIYn4-VUxg=/1200x0/filters:format(jpg):quality(70)/cloudfront-eu-central-1.images.arcpublishing.com/liberation/7P6HQVEB2RAD5HYV5RGLFK6GUI.jpg", publishedAt: "2023-01-05T15:27:26Z", content: "Une première depuis le début de la guerre en Ukraine. Dix mois après linvasion de lUkrai")
        let result = Result(status: "ok", totalResults: 1, articles: [article], message: nil, code: nil)
        
        XCTAssertTrue(source.id == "1")
        
        XCTAssertTrue(article.source == source)
        
        XCTAssertTrue(result.articles![0] == article)


        
    }

    
    func testCell() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let source = Source(id: "1", name: "le monde")
        let article = Article(source: source, author: "Moi", title: "une histoire", description: "BLABLA BLABLA", url: "https://www.liberation.fr/international/europe/guerre-en-ukraine-vladimir-poutine-ordonne-un-cessez-le-feu-les-6-et-7", urlToImage: "https://www.liberation.fr/resizer/4hbZgDs3me2FBbXN_iIYn4-VUxg=/1200x0/filters:format(jpg):quality(70)/cloudfront-eu-central-1.images.arcpublishing.com/liberation/7P6HQVEB2RAD5HYV5RGLFK6GUI.jpg", publishedAt: "2023-01-05T15:27:26Z", content: "Une première depuis le début de la guerre en Ukraine. Dix mois après linvasion de lUkrai")
        
     
        

        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
