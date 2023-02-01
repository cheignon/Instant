//
//  DetailViewRouter.swift
//  Instant
//
//  Created by dorian cheignon on 01/02/2023.
//

import UIKit

class DetailViewRouter: DetailViewRouterProtocol {
    static func ConfigureViewController(with article: Article, viewController: DetailViewController) {
        
        let presenter: DetailViewTheViewComunicateToPresenterProtocol & DetailViewInteractorCommunicateToPresenterProtocol = DetailViewPresenter() 
        
        viewController.presenter = presenter
        viewController.presenter?.router = DetailViewRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DetailViewInteractor()
        viewController.article = article
        viewController.presenter?.interactor?.presenter = presenter
        
    }
}
