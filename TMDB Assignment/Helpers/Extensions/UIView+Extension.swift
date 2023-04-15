//
//  UIView+Extension.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation
import UIKit

extension UIView {
    
    func roundWithCorners(corners:CACornerMask, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
        } else {
            print("not able to round specific corner")
        }
    }
    
    func simpleRound(){
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
    }
    
    func roundedUIView(withRadius radius: CGFloat){
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}

