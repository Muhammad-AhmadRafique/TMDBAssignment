//
//  NavigationController.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit

class NavigationController: UINavigationController,UIGestureRecognizerDelegate,UINavigationControllerDelegate {
    
    var isPushingViewController = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        interactivePopGestureRecognizer?.delegate = self
        navigationBar.shadowImage = UIImage()
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        isPushingViewController = true
        super.pushViewController(viewController, animated: animated)
    }
    
    //MARK: UIGestureRecognizerDelegate
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    //MARK: UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        isPushingViewController = false
    }
}

