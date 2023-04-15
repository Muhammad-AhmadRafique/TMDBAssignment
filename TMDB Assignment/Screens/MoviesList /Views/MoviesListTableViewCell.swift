//
//  MoviesListTableViewCell.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {

    @IBOutlet weak var posertIcon: UIImageView!
    @IBOutlet weak var titleLbl: RegularBlackLabel!
    @IBOutlet weak var dateLbl: RegularGrayLabel!
    @IBOutlet weak var favoriteIcon: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func favoriteButtonWasPressed(_ sender: Any) {
    }
    
    func configureCell(model: MovieModel) {
        titleLbl.text = model.title
        dateLbl.text = model.releaseDate
        if let url = URL(string: Common.getPosterPath(path: model.posterPath ?? "") ){
            posertIcon.sd_setImageWithURLWithFade(url: url, placeholderImage:Icons.RECTANGLE_PLACEHOLDER)
        } else {
            posertIcon.image = Icons.RECTANGLE_PLACEHOLDER
        }
    }
}
