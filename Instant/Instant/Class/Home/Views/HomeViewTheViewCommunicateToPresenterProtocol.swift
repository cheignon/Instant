//
//  HomeViewTheViewCommunicateToPresenterProtocol.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation

protocol HomeViewTheViewCommunicateToPresenterProtocol {
    
    var view: HomeViewPresentComunnicateToViewProtocol? { get set }
    var interactor: HomeViewPresenterComunnicateToInteractoreProtocol? { get set }
    var presenter: HomeViewPresentComunnicateToViewProtocol? { get set }
    var router: HomeViewRouteProtocol? { get set }
    var result: Result? { get set }
    func viewDidLoad()
    func loadOrRefreshIfNeeded()
    func numberOfRowsInSection() -> Int
    func didSelectRowAt(index: IndexPath)

}
