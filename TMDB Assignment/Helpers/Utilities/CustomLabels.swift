//
//  CustomLabels.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit
import Foundation

class RegularBlackLabel: UILabel {
    
    func setupView() {
        textColor = Colors.BLACK
        font = Fonts.HELVETICA_REGULAR_17
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
}

class RegularGrayLabel: UILabel {
    
    func setupView() {
        textColor = Colors.DARK_GRAY
        font = Fonts.HELVETICA_REGULAR_14
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
}
