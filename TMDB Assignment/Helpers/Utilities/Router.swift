//
//  Router.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import UIKit
//import AVFoundation
import Photos

class Router {
    
    static let shared = Router()
    
//    func openNotificationViewController(controller:UIViewController) -> Void {
//        let control = Storyboards.PROFILE.instantiateViewController(withIdentifier: NotificationViewController.className) as! NotificationViewController
//        control.addBackButtonOnly()
//        controller.show(control, sender: self)
//    }
//
    
    
    
    //********************************************************************************************************************
    //********************************************************************************************************************
    //**************************************   ADD Presented Controllers Code below Only *********************************
    //********************************************************************************************************************
    //********************************************************************************************************************

    
//    func openProfileViewController(controller:UIViewController) -> Void {
//        let control = Storyboards.MAIN.instantiateViewController(withIdentifier: ProfileViewController.className) as! ProfileViewController
//        control.addBackButtonOnly()
//        controller.show(control, sender: self)
//    }
    
    func getNavigationController(controller:UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
//        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isHidden = true
        navigationController.navigationBar.backgroundColor = UIColor.clear
        navigationController.modalPresentationStyle = .overFullScreen
        return navigationController
    }
    
//    func openDataPickerPopUpVC(content:Array<String>,
//                               title:String,
//                               selectedValue:String,
//                               controller:UIViewController,
//                               dataPickedHandler:@escaping DataPickerCompletionHandler) -> Void {
//        let control = Storyboards.POPUPS.instantiateViewController(withIdentifier: DataPickerPopUpVC.className) as! DataPickerPopUpVC
//        control.contentArray = content
//        control.headingTitle = title
//        control.selectedValue = selectedValue
//        control.dataPickedHandler = dataPickedHandler
//
//        controller.present(getNavigationController(controller: control), animated: true, completion: nil)
//
//    }
    
//
//    func openSetDateTimePopUPVC(title:String = "",
//                                minumumDate:Date? = nil,
//                                maximumDate:Date? = nil,
//                                alreadySelectedDate:Date? = nil,
//                                isDateOnly:Bool = false ,
//                                controller:UIViewController,
//                                completionHandler:@escaping DateSelectionCompletionHandler) -> Void {
//
//        let control = Storyboards.POPUPS.instantiateViewController(withIdentifier: SetDateTimePopUPVC.className) as! SetDateTimePopUPVC
//        control.headingString = title
//        control.alreadySelectedDate = alreadySelectedDate
//        control.minumumDate = minumumDate
//        control.maximumDate = maximumDate
//        control.isDateOnly = isDateOnly
//        control.doneButtonDidPressed = completionHandler
//
//        controller.present(getNavigationController(controller: control), animated: true, completion: nil)
//
//    }
    
//    func openMenuOptionPopUpVC(options:[MenuOptions],isEnable:Bool = true,selectedOption:MenuOptions? = nil,controller:UIViewController,completionHandler:@escaping MenuOptionSelectionCompletionHandler) -> Void {
//        let control = Storyboards.POPUPS.instantiateViewController(withIdentifier: MenuOptionPopUpVC.className) as! MenuOptionPopUpVC
//        control.options = options
//        control.selectedOption = selectedOption
//        control.selectionHandler = completionHandler
//        control.isEnable = isEnable
//        controller.presentPanModal(control)
//
//    }
    
    
}
