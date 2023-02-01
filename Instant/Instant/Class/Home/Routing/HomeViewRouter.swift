//
//  HomeViewRouter.swift
//  Instant
//
//  Created by dorian cheignon on 01/02/2023.
//

import UIKit

class HomeViewRouter: HomeViewRouteProtocol {

    
    static func ConfigureViewController(viewcontroller viewController: HomeViewController) {
        let presenter: HomeViewTheViewCommunicateToPresenterProtocol & HomeViewInteractorCommunicateToPresenterProtocol = HomeViewPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = HomeViewRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeViewInteractor()
        viewController.presenter?.interactor?.presenter = presenter
    }
    
    func presentDetailView(view: HomeViewController, article: Article) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        DetailViewRouter.ConfigureViewController(with: article, viewController: detailController)
        view.navigationController?.pushViewController(detailController, animated: true)
    }
    
}
