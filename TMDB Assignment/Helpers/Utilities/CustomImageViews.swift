//
//  CustomViews.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation
import UIKit


class RoundedPhotoView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        roundedUIView(withRadius: 8)
        clipsToBounds = true
    }
}

