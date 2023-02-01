//
//  DetailViewPresenter.swift
//  Instant
//
//  Created by dorian cheignon on 01/02/2023.
//

import Foundation
import Alamofire

class DetailViewPresenter:  DetailViewTheViewComunicateToPresenterProtocol {
    var view: DetailViewPresenterCommunicateToViewProtocol?
    var interactor: PresenterToInteractorQuoteDetailProtocol?
    var router: DetailViewRouterProtocol?
}
extension DetailViewPresenter : DetailViewInteractorCommunicateToPresenterProtocol{
    
}
