//
//  HomeViewInteractor.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation
import Alamofire
class HomeViewInteractor: HomeViewPresenterComunnicateToInteractoreProtocol {
   
   
    
    
    // MARK: Properties
    var presenter: HomeViewInteractorCommunicateToPresenterProtocol?
    var result: Result?
 
    
    func loadOrRefreshIfNeeded() {
        
        ApClient.shared.getHeadLine { response in
            self.checkTheResponse(response: response)
        }
    }
    
    func userDidFinishToTypeText(text: String) {
        ApClient.shared.getNewsWithThisSearch(text: text) { response in
            self.checkTheResponse(response: response)
        }
    }
    
    func checkTheResponse( response: AFDataResponse<Result>) {
        if response.error != nil {
            self.presenter?.getNewsFailure(error: response.error!)
            return
        }
        guard let result  = response.value else {
            let error = NSError(domain: "NewsApi.Org", code: 204, userInfo: [NSLocalizedFailureReasonErrorKey: "The result object is empty",
                                                                                    NSLocalizedDescriptionKey: "No data in the response"
                                                                                   ])
            let afError =  AFError.sessionTaskFailed(error: error)
            self.presenter?.getNewsFailure(error: afError)
            return
        }
        
        if result.status == "error" {
            guard let message = result.message, let statusCode = response.response?.statusCode else {
                return
            }
            let error = NSError(domain: "NewsApi.Org", code: statusCode, userInfo: [NSLocalizedFailureReasonErrorKey: message,
                                                                                           NSLocalizedDescriptionKey: message])
            let afError =  AFError.sessionTaskFailed(error: error)
            self.presenter?.getNewsFailure(error: afError)
            return
        }
        self.presenter?.getNewsSuccess(result: result)
    }
    
}




