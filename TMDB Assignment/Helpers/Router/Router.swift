//
//  Router.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit

class Router {
    
    static let shared = Router()
    
    func openMovieDetailViewController(model: MovieModel?, controller:UIViewController) -> Void {
        let control = Storyboards.MAIN.instantiateViewController(withIdentifier: MovieDetailViewController.className) as! MovieDetailViewController
        control.movie = model
        control.addBackButtonOnly()
        controller.show(control, sender: self)
    }
    
    func openFavoriteMoviesViewController(controller:UIViewController) -> Void {
        let control = Storyboards.MAIN.instantiateViewController(withIdentifier: FavoriteMoviesViewController.className) as! FavoriteMoviesViewController
        control.addBackButtonOnly()
        controller.show(control, sender: self)
    }

    func openSearchViewController(controller:UIViewController) -> Void {
        let control = Storyboards.MAIN.instantiateViewController(withIdentifier: SearchViewController.className) as! SearchViewController
        control.addBackButtonOnly()
        controller.show(control, sender: self)
    }
    
}
