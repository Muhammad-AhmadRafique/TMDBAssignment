//
//  SuggestionListDB.swift
//  TMDB Assignment
//
//  Created by Ahmad on 16/04/2023.
//

import Foundation


struct SuggestionListDB {
    
    static let instance = SuggestionListDB()
    
    private let defaults = UserDefaults.standard
    
    func saveData(model:SuggestionsListModel) -> Void {
        
        let defaults = UserDefaults.standard
        defaults.set(try? PropertyListEncoder().encode(model), forKey: "\(SuggestionListDB.self)")
        
    }
    
    func fetchData() -> SuggestionsListModel? {
        
        let defaults = UserDefaults.standard
        
        if let data = defaults.object(forKey: "\(SuggestionListDB.self)") as? Data{
            if let staticModel = try? PropertyListDecoder().decode(SuggestionsListModel.self, from: data) {
                return staticModel
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}


struct SuggestionsListModel : Codable {
    let suggestion : [String]?
}
