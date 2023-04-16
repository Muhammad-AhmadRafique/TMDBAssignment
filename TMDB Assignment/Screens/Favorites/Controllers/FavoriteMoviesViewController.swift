//
//  FavoriteMoviesViewController.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noFavoritesLbl: RegularBlackLabel!
    
    private var moviesList = [MovieModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Favorites"

        tableView.register(UINib(nibName: FavoriteMoviesListTableViewCell.className, bundle: nil), forCellReuseIdentifier: FavoriteMoviesListTableViewCell.className)
        
        fetchMovies()
    }
    
}

//MARK: - UITableView Delegates
extension FavoriteMoviesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteMoviesListTableViewCell.className) as! FavoriteMoviesListTableViewCell
        cell.configureCell(model: moviesList[indexPath.row])
        cell.favoriteBtnTapped = {
            self.makeUnFavorite(model: self.moviesList[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.removeSelection()
        Router.shared.openMovieDetailViewController(model: moviesList[indexPath.row], controller: self)
    }
    
    private func makeUnFavorite(model: MovieModel) {
        LocalDB.shared.markFavorite(model: model)
        fetchMovies()
    }
}

extension FavoriteMoviesViewController {
    private func fetchMovies() {
        moviesList = LocalDB.shared.getFavoritesList()
        noFavoritesLbl.isHidden = !(moviesList.count == 0)
    }
}
