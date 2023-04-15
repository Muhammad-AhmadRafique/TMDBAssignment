//
//  ModeSelection.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation
import UIKit

class ModeSelection {
    static let instance = ModeSelection()
    
    func appMode() -> Void {
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let delegate = windowScene.delegate as? SceneDelegate {
                    if let window = delegate.window {
                        let rootVC = Storyboards.MAIN.instantiateViewController(withIdentifier: NavigationController.className)
                        window.rootViewController = rootVC
                        window.makeKeyAndVisible()
                    }
                }
            }
        }
    }
    
}
