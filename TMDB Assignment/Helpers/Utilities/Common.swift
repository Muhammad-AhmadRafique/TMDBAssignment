//
//  Common.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit
import Photos

class Common: NSObject {
    
    static func getPosterPath(path: String) -> String {
        return posterURL + path
    }
}
