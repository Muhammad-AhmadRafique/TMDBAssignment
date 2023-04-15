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
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: MoviesListCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: MoviesListCollectionViewCell.className)

        fetchMovies()
    }
    
}

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
        self.collectionView.reloadData()      
    }
}

extension MoviesListViewController {
    private func fetchMovies() {
        showProgressHud()
        let url = API.movies
        APIGeneric<GetPopularMoviesResponseModel>.fetchRequest(apiURL: url) { [weak self]
            (result) in
            guard let `self`  = self else { return }
            DispatchQueue.main.async {
                self.hideProgressHud()
                switch result {
                case .success(let responseModel):
                    self.moviesList = responseModel.results ?? []
                case .failure(let error):
                    let err = CustomError(description: (error as? CustomError)?.description ?? "")
                    self.alertMessage(title: K.ERROR, alertMessage: err.description ?? "", action: nil)
                }
            }
        }
    }
}
