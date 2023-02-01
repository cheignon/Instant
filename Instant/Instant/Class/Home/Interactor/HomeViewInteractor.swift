//
//  HomeViewInteractor.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation

class HomeViewInteractor: HomeViewPresenterComunnicateToInteractoreProtocol {
   
   
    
    
    // MARK: Properties
    var presenter: HomeViewInteractorCommunicateToPresenterProtocol?
    var result: Result?
 
    
    func loadOrRefreshIfNeeded() {
        ApClient.shared.getHeadLine { response in
            if response.error != nil {
                self.presenter?.getNewsFailure(error: response.error!)
                return
            }
            guard let result  = response.value else {
                self.presenter?.getNewsFailure(error: response.error!)
                return
            }
            self.presenter?.getNewsSuccess(result: result)
        }
    }
    
    func userDidFinishToTypeText(text: String) {
        ApClient.shared.getNewsWithThisSearch(text: text) { response in
            if response.error != nil {
                self.presenter?.getNewsFailure(error: response.error!)
                return
            }
            
            guard let result  = response.value else {
                self.presenter?.getNewsFailure(error: response.error!)
                return
            }
            self.presenter?.getNewsSuccess(result: result)

        }
    }
    
}




