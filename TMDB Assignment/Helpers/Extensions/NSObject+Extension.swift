//
//  NSObject+Extension.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation

extension NSObject {

    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
