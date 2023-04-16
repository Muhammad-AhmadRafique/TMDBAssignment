//
//  MovieDetailViewController.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var posertIcon: RoundedPhotoView!
    @IBOutlet weak var titleLbl: RegularBlackLabel!
    @IBOutlet weak var dateLbl: RegularGrayLabel!
    @IBOutlet weak var overviewLbl: RegularGrayLabel!
    @IBOutlet weak var favoriteIcon: UIButton!
    
    var movie: MovieModel?
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movie Details"
        setupView()
    }
    
    //MARK: - IBActions
    @IBAction func favoriteButtonWasPressed(_ sender: Any) {
        if let m = movie {
            LocalDB.shared.markFavorite(model: m)
            checkFavorite(model: m)
        }
    }
    
    //MARK: - Helper Methods
    private func setupView() {
        if let model = movie {
            titleLbl.text = model.title
            setDate(dateStr: model.releaseDate)
            setImage(url: model.posterPath ?? "")
            checkFavorite(model: model)
            overviewLbl.text = model.overview
        }
    }
    
    private func setImage(url: String) {
        if let url = URL(string: Common.getPosterPath(path: url) ){
            posertIcon.sd_setImageWithURLWithFade(url: url, placeholderImage:Icons.RECTANGLE_PLACEHOLDER)
        } else {
            posertIcon.image = Icons.RECTANGLE_PLACEHOLDER
        }
    }
    
    private func setDate(dateStr: String?) {
        dateLbl.text = Common.getReleaseDate(dateStr: dateStr)
    }
    
    private func checkFavorite(model: MovieModel) {
        if LocalDB.shared.checkIsFavorite(model: model) {
            favoriteIcon.setImage(Icons.FAVORITE, for: .normal)
        } else {
            favoriteIcon.setImage(Icons.UNFAVORITE, for: .normal)
        }
        
    }
    
}
