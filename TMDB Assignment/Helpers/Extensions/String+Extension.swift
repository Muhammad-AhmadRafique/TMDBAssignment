//
//  String+Extension.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation

extension String {

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    func getLocalDate() -> Date{
        let startIndex = self.index(self.startIndex, offsetBy: 0)
        let endIndex = self.index(self.startIndex, offsetBy: 18)
        let substring = self[startIndex...endIndex]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        
        let convertedlocalTime = String(substring).UTCToLocal()
        dateFormatter.locale = DateFormats.EN_US_POSIX
        let localDate = dateFormatter.date(from: convertedlocalTime)
        
        return localDate!
    }
    
    func UTCToLocal() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        dateFormatter.timeZone = DateFormats.UTC_TIME_ZONE
        dateFormatter.locale = DateFormats.EN_US_POSIX
        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        let localDate = dateFormatter.string(from: dt ?? Date())
        return localDate
    }
}
