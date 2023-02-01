//
//  HomeViewRouteProtocol.swift
//  Instant
//
//  Created by dorian cheignon on 01/02/2023.
//

import UIKit

protocol HomeViewRouteProtocol {
    static func ConfigureViewController(viewcontroller: HomeViewController)
    func presentDetailView(view: HomeViewController, article: Article)
}
