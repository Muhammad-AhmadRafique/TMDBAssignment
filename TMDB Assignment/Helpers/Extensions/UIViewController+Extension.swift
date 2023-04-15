//
//  UIViewController+Extension.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit
import Foundation
import MBProgressHUD

extension UIViewController {
    func alertMessage(title: String, alertMessage:String, action: (() -> Void)?)
    {
        if alertMessage.lowercased().contains("cancelled") || alertMessage.lowercased().contains("caused connection abort") || alertMessage.contains("The Internet connection appears to be offline."){
            return
        }
        
        DispatchQueue.main.async {
            self.hideProgressHud()
            
            var str = ""
            if alertMessage.isEmpty {
                str = alertMessage
            } else {
                str = alertMessage.capitalizingFirstLetter()
            }

            let myAlert = UIAlertController(title:"", message:str, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
                UIAlertAction in
                action?()
            }
            myAlert.addAction(okAction);
            self.present(myAlert, animated:true, completion:nil)
        }
    }
    
    func showProgressHud(title:String = K.LOADING_KEY) -> Void {
        let progressHud = MBProgressHUD.showAdded(to: view, animated: true)
        progressHud.label.text = title
    }
    
    func hideProgressHud() -> Void {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view , animated: true)
        }
    }
    
    func addBackButtonOnly(){
        let button: UIButton = UIButton (type: UIButton.ButtonType.custom)
        button.setImage(Icons.BACK_ARROW_BACK_ICON, for: UIControl.State.normal)
        button.contentMode = .left
        button.addTarget(self, action: #selector(backButtonPressed(btn:)), for: UIControl.Event.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 40)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: button.imageView!.image!.size.width / 2)
        button.contentHorizontalAlignment = .left
        button.imageView?.contentMode = .scaleAspectFit
        
        let barButton = UIBarButtonItem(customView: button)
        if let navcontroller = self.navigationController{
            navcontroller.navigationItem.leftBarButtonItem = barButton
        }else{
            self.navigationItem.leftBarButtonItem = barButton
        }
    }
    
    
    @objc func backButtonPressed(btn:UIButton) {
        if let navController = navigationController {
            if navController.viewControllers.count > 1 {
                self.navigationController?.popViewController(animated: true)
            } else if isModal {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    var isModal: Bool {
        
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }

}
