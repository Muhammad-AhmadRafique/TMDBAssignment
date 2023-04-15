//
//  UITableView+Extension.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation
import UIKit

extension UITableView {
    func removeSelection() -> Void {
        if let indexs = self.indexPathsForSelectedRows{
            indexs.forEach({ (indexPath) in
                self.deselectRow(at: indexPath, animated: true)
            })
        }
    }

}
