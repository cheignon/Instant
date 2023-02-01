//
//  HomeViewPresenter.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation
import Alamofire

class HomeViewPresenter: HomeViewTheViewCommunicateToPresenterProtocol {
    var presenter: HomeViewPresentComunnicateToViewProtocol?
    var result: Result?
    var view: HomeViewPresentComunnicateToViewProtocol?
    var interactor: HomeViewPresenterComunnicateToInteractoreProtocol?
    var router: HomeViewRouteProtocol?

    
    func viewDidLoad() {
        self.interactor?.loadOrRefreshIfNeeded()
    }
    
    func loadOrRefreshIfNeeded() {
        //self.interactor.
    }
    
    func numberOfRowsInSection() -> Int {
        guard let result = self.result else {
            return 0
        }
        return result.totalResults ?? 0
    }
    
    func didSelectRowAt(index: IndexPath) {
        guard let result = self.result, result.getCountOfArticles() > index.row , let article = result.articles?[index.row] else {
            return
        }
        guard let homeViewcontroller =  self.view as? HomeViewController else {
            return
        }
        self.router?.presentDetailView(view: homeViewcontroller, article: article)
    }
    
    func deselectRowAt(index: IndexPath) {
        

    }
    
}


extension HomeViewPresenter: HomeViewPresentComunnicateToViewProtocol {
    func onFetchNewsSuccess(result: Result) {
        
    }
    
    func onFetchNewsFailure(error: AFError) {
    
    }
    
    
}

extension HomeViewPresenter: HomeViewInteractorCommunicateToPresenterProtocol {
    
    func viewWillAppear() {
        self.interactor?.loadOrRefreshIfNeeded()
    }
    
    func getNewsFailure(error: Alamofire.AFError) {
        self.view?.onFetchNewsFailure(error: error)
    }
    
    func getNewsSuccess(result: Result) {
        self.result = result
        self.view?.onFetchNewsSuccess(result: result)
    }
    
}
