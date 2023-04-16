//
//  SuggestionsTableViewCell.swift
//  TMDB Assignment
//
//  Created by Ahmad on 16/04/2023.
//

import UIKit

class SuggestionsTableViewCell: UITableViewCell {

    @IBOutlet weak var suggestionLbl: RegularBlackLabel!
    
    var suggestionTapped: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(str: String) {
        suggestionLbl.text = str
    }
    
    @IBAction func buttonWasPressed(_ sender: Any) {
        suggestionTapped?()
    }
}
