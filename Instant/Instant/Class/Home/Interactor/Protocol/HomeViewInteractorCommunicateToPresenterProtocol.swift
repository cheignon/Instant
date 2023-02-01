//
//  HomeViewInteractorCommunicateToPresenterProtocol.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation
import Alamofire
protocol HomeViewInteractorCommunicateToPresenterProtocol {
    func viewWillAppear()
    func getNewsSuccess(result: Result)
    func getNewsFailure(error: AFError)
}
