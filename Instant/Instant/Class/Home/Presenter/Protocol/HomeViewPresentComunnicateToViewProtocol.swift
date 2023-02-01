//
//  HomeViewPresentComunnicateToViewProtocol.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation
import Alamofire
protocol HomeViewPresentComunnicateToViewProtocol {
    func onFetchNewsFailure(error: AFError)
    func onFetchNewsSuccess(result: Result)
    func deselectRowAt(index: IndexPath)
    func viewWillAppear()
}
