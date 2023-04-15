//
//  UIViewController+Extension.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit
import Foundation

extension UIViewController {
    func alertMessage(title: String, alertMessage:String, action: (() -> Void)?)
    {
        if alertMessage.lowercased().contains("cancelled") || alertMessage.lowercased().contains("caused connection abort") || alertMessage.contains("The Internet connection appears to be offline."){
            return
        }
        
        DispatchQueue.main.async {
//            self.hideProgressHud()
            
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
}
