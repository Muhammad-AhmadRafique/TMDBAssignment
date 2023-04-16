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
    
    static func getReleaseDate(dateStr: String?) -> String {
        var result = ""
        if let date = dateStr {
            if date.isEmpty {
                result = Date().convertTimeToUTC().getLocalDate().timeAgoSinceDate()
            } else {
                let str = date + "T00:00:00"
                result = str.getLocalDate().timeAgoSinceDate()
            }
        } else {
            result = Date().convertTimeToUTC().getLocalDate().timeAgoSinceDate()
        }
        return result
    }
}
