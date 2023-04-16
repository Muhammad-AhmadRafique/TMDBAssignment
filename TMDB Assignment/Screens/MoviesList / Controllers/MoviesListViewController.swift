//
//  MoviesListViewController.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var moviesList = [MovieModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    private var isLoading = false
    private var page = 1
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: MoviesListCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: MoviesListCollectionViewCell.className)

        fetchMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
        
    //MARK: - IBActions
    @IBAction func favoritesButtonWasPressed(_ sender: Any) {
        Router.shared.openFavoriteMoviesViewController(controller: self)
    }
    @IBAction func searchButtonWasPressed(_ sender: Any) {
        Router.shared.openSearchViewController(controller: self)
    }
}

//MARK: - UICollectionView Delegates
extension MoviesListViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width/2, height: 200)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesListCollectionViewCell.className, for: indexPath) as! MoviesListCollectionViewCell
        let model = moviesList[indexPath.row]
        cell.configureCell(model: model)
        cell.favoriteBtnTapped = {
            self.makeFavorite(model: model)
        }
        return cell
    }
    
    private func makeFavorite(model: MovieModel) {
        LocalDB.shared.markFavorite(model: model)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Router.shared.openMovieDetailViewController(model: moviesList[indexPath.row], controller: self)
    }
    
    //MARK: - Pagination Logic
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView.contentOffset.y >= (collectionView.contentSize.height - collectionView.frame.size.height) {
            updateSkipTakeDataOnScroll()
        }
    }
    
    private func skipTakeImplementation(responseArray: [MovieModel]) {
        if moviesList.count > 0 && page != 1 {
            for obj in responseArray {
                moviesList.append(obj)
            }
        } else {
            moviesList = responseArray
        }
        isLoading = responseArray.count == 0
    }
    
    func updateSkipTakeDataOnScroll() {
        if !self.isLoading {
            self.isLoading = true
            self.page += 1
            self.fetchMovies()
        }
    }
    
}

//MARK: - APIs
extension MoviesListViewController {
    private func fetchMovies() {
        showProgressHud()
        let url = API.movies + "&page=" + "\(page)"
        APIGeneric<GetPopularMoviesResponseModel>.fetchRequest(apiURL: url) { [weak self]
            (result) in
            guard let `self`  = self else { return }
            DispatchQueue.main.async {
                self.hideProgressHud()
                switch result {
                case .success(let responseModel):
                    let list = responseModel.results ?? []
                    self.skipTakeImplementation(responseArray: list)
                case .failure(let error):
                    let err = CustomError(description: (error as? CustomError)?.description ?? "")
                    self.alertMessage(title: K.ERROR, alertMessage: err.description ?? "", action: nil)
                }
            }
        }
    }
}
