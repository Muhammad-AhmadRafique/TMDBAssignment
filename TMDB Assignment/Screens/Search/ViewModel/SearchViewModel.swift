//
//  SearchViewModel.swift
//  TMDB Assignment
//
//  Created by Ahmad on 16/04/2023.
//

import Foundation

protocol SearchViewModelDelegate: NSObject {
    func responseComes(list: [MovieModel])
    func errorComes(error: CustomError?)
}

class SearchViewModel {
    
    weak var delegate : SearchViewModelDelegate?
    
    private var moviesList = [MovieModel]()
    private var isLoading = false
    private var page = 1
    private var searchString = ""
    
    func initialize() {
        session.cancelRequest(withURL: API.movies)
        searchString = ""
        page = 1
        isLoading = false
        moviesList = []
    }

    func bindSearchField(str: String) {
        print(str)
        initialize()
        searchString = str
        fetchMovies()
    }
    
    func getMoviesList() -> [MovieModel]{
        return moviesList
    }
    
    private func fetchMovies() {
        let url = API.search + "&page=" + "\(page)" + "&query=" + searchString
        APIGeneric<GetPopularMoviesResponseModel>.fetchRequest(apiURL: url) { [weak self]
            (result) in
            guard let `self`  = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let responseModel):
                    let list = responseModel.results ?? []
                    self.skipTakeImplementation(responseArray: list)
                    self.delegate?.responseComes(list: self.moviesList)
                case .failure(let error):
                    let err = CustomError(description: (error as? CustomError)?.description ?? "")
                    self.delegate?.errorComes(error: err)
                }
            }
        }
    }
    
    private func skipTakeImplementation(responseArray: [MovieModel]) {
        if self.moviesList.count > 0 && self.page != 1 {
            for obj in responseArray {
                self.moviesList.append(obj)
            }
        } else {
            self.moviesList = responseArray
        }
        
        self.isLoading = responseArray.count == 0
        
    }
    
    func updateSkipTakeDataOnScroll() {
        if !self.isLoading {
            self.isLoading = true
            self.page += 1
            self.fetchMovies()
        }
    }
    
}
