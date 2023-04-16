//
//  MoviesListCollectionViewCell.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit

class MoviesListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posertIcon: UIImageView!
    @IBOutlet weak var titleLbl: RegularBlackLabel!
    @IBOutlet weak var dateLbl: RegularGrayLabel!
    @IBOutlet weak var favoriteIcon: UIButton!
    
    var favoriteBtnTapped: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func favoriteButtonWasPressed(_ sender: Any) {
        favoriteBtnTapped?()
    }
    
    func configureCell(model: MovieModel) {
        titleLbl.text = model.title
        setDate(dateStr: model.releaseDate)
        setImage(url: model.posterPath ?? "")
        checkFavorite(model: model)
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
