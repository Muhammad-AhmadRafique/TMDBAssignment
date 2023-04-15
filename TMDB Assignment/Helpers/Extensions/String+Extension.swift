//
//  String+Extension.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation

extension String {

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
