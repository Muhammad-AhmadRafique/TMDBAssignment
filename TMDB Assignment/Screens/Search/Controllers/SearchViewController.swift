//
//  SearchViewController.swift
//  TMDB Assignment
//
//  Created by Ahmad on 16/04/2023.
//

import UIKit

class SearchViewController: UIViewController, SearchViewModelDelegate {

    @IBOutlet weak var noSearchResultLbl: RegularBlackLabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    private var viewModel = SearchViewModel()
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Favorites"

        tableView.register(UINib(nibName: FavoriteMoviesListTableViewCell.className, bundle: nil), forCellReuseIdentifier: FavoriteMoviesListTableViewCell.className)
        
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @objc private func setupViewModel() {
        viewModel.initialize()
        viewModel.delegate = self
    }
    
    func responseComes(list: [MovieModel]) {
        noSearchResultLbl.isHidden = !(list.count == 0)
        tableView.reloadData()
    }
    
    func errorComes(error: CustomError?) {
        alertMessage(title: K.ERROR, alertMessage: error?.description ?? "", action: nil)
        tableView.reloadData()
    }
}

extension SearchViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.bindSearchField(str: searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if viewModel.getMoviesList().count == 0 {
            alertMessage(title: K.ERROR, alertMessage: "No result found...!", action: nil)
        }
    }
}

extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMoviesList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteMoviesListTableViewCell.className) as! FavoriteMoviesListTableViewCell
        cell.configureCell(model: viewModel.getMoviesList()[indexPath.row])
        cell.favoriteBtnTapped = {
            self.makeUnFavorite(model: self.viewModel.getMoviesList()[indexPath.row])
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.contentOffset.y >= (tableView.contentSize.height - tableView.frame.size.height) {
            viewModel.updateSkipTakeDataOnScroll()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.removeSelection()
        Router.shared.openMovieDetailViewController(model: viewModel.getMoviesList()[indexPath.row], controller: self)
    }
    
    private func makeUnFavorite(model: MovieModel) {
        LocalDB.shared.markFavorite(model: model)
        tableView.reloadData()
    }
}
