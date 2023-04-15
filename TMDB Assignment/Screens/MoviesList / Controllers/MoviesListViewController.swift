//
//  MoviesListViewController.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit

class MoviesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchMovies()
    }
    

}

extension MoviesListViewController {
    private func fetchMovies() {
        let url = API.movies
        APIGeneric<GetPopularMoviesResponseModel>.fetchRequest(apiURL: url) { [weak self]
            (result) in
            guard let `self`  = self else { return }
            DispatchQueue.main.async {
//                self.hideProgressHud()
                switch result {
                case .success(let responseModel):
                    
//                    if responseModel.isError{
                        print(responseModel)
//                    } else {
                       
//                    }
                case .failure(let error):
                    let err = CustomError(description: (error as? CustomError)?.description ?? "")
                    print(err)
                    self.alertMessage(title: K.ERROR, alertMessage: err.description ?? "", action: nil)
                }
            }
        }
    }
}
