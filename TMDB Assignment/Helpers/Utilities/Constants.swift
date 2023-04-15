//
//  Constants.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation


import Foundation
import UIKit

struct Storyboards {
    static let MAIN = UIStoryboard(name: "Main", bundle: nil)
    static let POPUPS = UIStoryboard(name: "Popups", bundle: nil)
}

struct Fonts {
    static let HELVETICA_BOLD_12 = UIFont(name: "Helvetica-Bold", size: 12)!
    static let HELVETICA_BOLD_14  = UIFont(name: "Helvetica-Bold", size: 14)!
    static let HELVETICA_BOLD_15 = UIFont(name: "Helvetica-Bold", size: 15)!
    static let HELVETICA_BOLD_16 = UIFont(name: "Helvetica-Bold", size: 16)!
    static let HELVETICA_BOLD_17 = UIFont(name: "Helvetica-Bold", size: 17)!
    static let HELVETICA_BOLD_18 = UIFont(name: "Helvetica-Bold", size: 18)!
    static let HELVETICA_BOLD_19 = UIFont(name: "Helvetica-Bold", size: 19)!
    static let HELVETICA_BOLD_20 = UIFont(name: "Helvetica-Bold", size: 20)!
    static let HELVETICA_BOLD_30 = UIFont(name: "Helvetica-Bold", size: 30)!

    static let HELVETICA_REGULAR_12 = UIFont(name: "Helvetica", size: 12)!
    static let HELVETICA_REGULAR_14 = UIFont(name: "Helvetica", size: 14)!
    static let HELVETICA_REGULAR_15 = UIFont(name: "Helvetica", size: 15)!
    static let HELVETICA_REGULAR_16 = UIFont(name: "Helvetica", size: 16)!
    static let HELVETICA_REGULAR_17 = UIFont(name: "Helvetica", size: 17)!
    static let HELVETICA_REGULAR_18 = UIFont(name: "Helvetica", size: 18)!
    static let HELVETICA_REGULAR_19 = UIFont(name: "Helvetica", size: 19)!
    static let HELVETICA_REGULAR_20 = UIFont(name: "Helvetica", size: 20)!
    static let HELVETICA_REGULAR_21 = UIFont(name: "Helvetica", size: 21)!
    static let HELVETICA_REGULAR_22 = UIFont(name: "Helvetica", size: 22)!
    static let HELVETICA_REGULAR_23 = UIFont(name: "Helvetica", size: 23)!
    static let HELVETICA_REGULAR_24 = UIFont(name: "Helvetica", size: 24)!
    static let HELVETICA_REGULAR_25 = UIFont(name: "Helvetica", size: 25)!
    static let HELVETICA_REGULAR_26 = UIFont(name: "Helvetica", size: 26)!

    static let HELVETICA_LIGHT_15 = UIFont(name: "Helvetica-Light", size: 15)!
    
}

struct Icons {
    static let RECTANGLE_PLACEHOLDER = UIImage(named: "rectangle_placeholder")
    static let FAVORITE = UIImage(named: "favorite_icon")
    static let UNFAVORITE = UIImage(named: "unfavorite_icon")

    
}

struct Colors {
    static let BLACK = UIColor(named: "black")!
    static let LIGHT_WHITE = UIColor(named: "light_white_color")!
    static let WHITE = UIColor(named: "white")!
    static let LIGHT_GREY = UIColor(named: "light_gray")!
    static let SEPARATOR_COLOR = UIColor(named: "textfield_line_color")!
    static let GRAY = UIColor(named: "textfield_line_color")!
    static let DARK_GRAY = UIColor(named: "dark_gray")!
}

struct K {
    static let LOADING_KEY = "loading..."
    static let ALERT = "Alert"
    static let ERROR = "Error"
    static let SUCCESS = "Success"
    static let TRUE = "true"
    static let FALSE = "false"

}

struct Alerts {
    
}

extension Notification.Name {
//    static let NETWORK_ARRIVE = NSNotification.Name.init(rawValue: "networkArrive")
}

struct DateFormats {
    static let yyyyMMdd = "yyyy/MM/dd"
    static let MMMMdyyyy = "MMMM d, yyyy"
    static let MMMddyyyy = "MMM dd, yyyy"
    static let EMMMdyyyy = "E, MMM d, yyyy"
    static let MMMdyyyy = "MMM d, yyyy"
    static let MMMd = "MMM d"
    static let dMMMMyyy = "d MMMM yyyy"
    static let NOTIFICATION_TIME_FORMAT = "MMMM dd, yyyy - hh:mm a"
    static let TIME_FORMAT = "h:mm a"
    static let DATE_TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss"
    static let CALENDAR_DATE_TIME_FORMAT = "yyyy-MM-dd"
    static let MY_CARDS_DATE_FORMAT = "MMM dd, yyyy - hh:mm a"
    static let EN_US_POSIX = Locale(identifier: "en_US_POSIX")
    static let UTC_TIME_ZONE = TimeZone(abbreviation: "UTC")
}

struct UserDefaultKeys {
    
}
