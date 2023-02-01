//
//  DetailViewTheViewComunicateToPresenterProtocol.swift
//  Instant
//
//  Created by dorian cheignon on 01/02/2023.
//

import Foundation

protocol DetailViewTheViewComunicateToPresenterProtocol {
    var view: DetailViewPresenterCommunicateToViewProtocol? { get set }
    var interactor: PresenterToInteractorQuoteDetailProtocol? { get set }
    var router: DetailViewRouterProtocol? { get set }
}
