//
//  HomeViewRouteProtocol.swift
//  Instant
//
//  Created by dorian cheignon on 01/02/2023.
//

import UIKit

protocol HomeViewRouteProtocol {
    /// this function allows to settup every composant of MVVM architectur
    /// - Parameters:
    ///    - viewcontroller: the viewcontroller you want setup
    static func ConfigureViewController(viewcontroller: HomeViewController)
    
    /// this funxtion allows to route on the next  viewcontroller
    /// - Parameters:
    ///    - view: it's the current viewcontroler
    ///   - article: it's object to pass on the next view controller 
    func presentDetailView(view: HomeViewController, article: Article)
}
