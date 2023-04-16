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
    private var suggestionViewModel = SuggestionsViewModel()
        
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Search"

        tableView.register(UINib(nibName: FavoriteMoviesListTableViewCell.className, bundle: nil), forCellReuseIdentifier: FavoriteMoviesListTableViewCell.className)
        tableView.register(UINib(nibName: SuggestionsTableViewCell.className, bundle: nil), forCellReuseIdentifier: SuggestionsTableViewCell.className)

        setupViewModels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: - Helper Methods
    private func setupViewModels() {
        viewModel.initialize()
        viewModel.delegate = self
        suggestionViewModel.initialize()
    }
    
    private func setupNoResultLabel() {
        if viewModel.getMoviesList().count != 0 || suggestionViewModel.getIsSuggestionEnabled() {
            noSearchResultLbl.isHidden = true
        } else {
            noSearchResultLbl.isHidden = false
        }
    }
    
    //MARK: - API Delegates
    func responseComes(list: [MovieModel]) {
        setupNoResultLabel()
        tableView.reloadData()
    }
    
    func errorComes(error: CustomError?) {
        alertMessage(title: K.ERROR, alertMessage: error?.description ?? "", action: nil)
        tableView.reloadData()
    }
}

//MARK: - UISearchBarDelegate
extension SearchViewController : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        suggestionViewModel.addBinding()
        setupNoResultLabel()
        tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        suggestionViewModel.removeBinding()
        setupNoResultLabel()
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchFieldChange(str: searchText)
    }
    
    func searchFieldChange(str:String) {
        setupNoResultLabel()
        suggestionViewModel.removeBinding()
        viewModel.bindSearchField(str: str)
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let searchBarText = searchBar.text ?? ""
        if viewModel.getMoviesList().count == 0 && !searchBarText.isEmpty {
            alertMessage(title: K.ERROR, alertMessage: Alerts.NO_RESULT_FOUND, action: nil)
        } else {
            suggestionViewModel.addSuggesion(str: searchbar.text)
        }
    }
}

//MARK: - UITableView Delegates
extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if suggestionViewModel.getIsSuggestionEnabled() {
            return suggestionViewModel.getSuggesionsList().count
        } else {
            return viewModel.getMoviesList().count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if suggestionViewModel.getIsSuggestionEnabled() {
            let cell = tableView.dequeueReusableCell(withIdentifier: SuggestionsTableViewCell.className) as! SuggestionsTableViewCell
            cell.configureCell(str: suggestionViewModel.getSuggesionsList()[indexPath.row])
            cell.suggestionTapped = {
                //setting suggestion text to searchBar and performing search
                self.searchbar.text = self.suggestionViewModel.getSuggesionsList()[indexPath.row]
                self.searchFieldChange(str: self.searchbar.text ?? "")
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteMoviesListTableViewCell.className) as! FavoriteMoviesListTableViewCell
            cell.configureCell(model: viewModel.getMoviesList()[indexPath.row])
            cell.favoriteBtnTapped = {
                self.makeUnFavorite(model: self.viewModel.getMoviesList()[indexPath.row])
            }
            return cell
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.contentOffset.y >= (tableView.contentSize.height - tableView.frame.size.height) {
            viewModel.updateSkipTakeDataOnScroll()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.removeSelection()
        if !suggestionViewModel.getIsSuggestionEnabled() {
            suggestionViewModel.addSuggesion(str: searchbar.text)
            Router.shared.openMovieDetailViewController(model: viewModel.getMoviesList()[indexPath.row], controller: self)
        }
    }
    
    private func makeUnFavorite(model: MovieModel) {
        LocalDB.shared.markFavorite(model: model)
        tableView.reloadData()
    }
}
