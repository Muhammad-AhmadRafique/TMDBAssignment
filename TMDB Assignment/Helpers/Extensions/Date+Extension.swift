//
//  Date+Extension.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation

extension Date {
    
    func convertTimeToUTC() -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = DateFormats.EN_US_POSIX
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        dateFormatter.timeZone = DateFormats.UTC_TIME_ZONE
        return dateFormatter.string(from: self)
    }
    
    func timeAgoSinceDate() -> String {
        
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = Date()
        let earliest = now < self ? now : self
        let latest = (earliest == now) ? self : now
        let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
        
        if (components.year! >= 2) {
            return "\(components.year!) Years ago"
        } else if (components.year! >= 1){
            return "1 Year ago"
        } else if (components.month! >= 2) {
            return "\(components.month!) Months ago"
        } else if (components.month! >= 1){
            return "1 Month ago"
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) Weeks ago"
        } else if (components.weekOfYear! >= 1){
            return "1 Week ago"
        } else if (components.day! >= 2) {
            return "\(components.day!) Days ago"
        } else if (components.day! >= 1){
            return "1 Day ago"
        } else if (components.hour! >= 2) {
            return "\(components.hour!) Hours ago"
        } else if (components.hour! >= 1){
            return "1 Hour ago"
        } else if (components.minute! >= 2) {
            return "\(components.minute!) Mins ago"
        } else if (components.minute! >= 1){
            return "1 Min ago"
        } else {
            return "Just Now"
        }
    }
}
