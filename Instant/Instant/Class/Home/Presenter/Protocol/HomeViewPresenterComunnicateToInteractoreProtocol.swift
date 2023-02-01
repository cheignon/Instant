//
//  HomeViewPresenterComunnicateToInteractoreProtocol.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation

protocol HomeViewPresenterComunnicateToInteractoreProtocol {
    var presenter: HomeViewInteractorCommunicateToPresenterProtocol? { get set }
    func loadOrRefreshIfNeeded()
    func userDidFinishToTypeText(text: String)
}
