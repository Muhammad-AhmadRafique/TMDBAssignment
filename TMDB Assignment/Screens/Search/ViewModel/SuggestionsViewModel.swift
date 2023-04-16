//
//  SuggestionsViewModel.swift
//  TMDB Assignment
//
//  Created by Ahmad on 16/04/2023.
//

import Foundation


class SuggestionsViewModel {
    
    private var isSuggestionEnabled = false
    private var suggestionsList = [String]()
    
    func initialize() {
        suggestionsList = LocalDB.shared.getSuggestionList()
    }
    
    func addBinding() {
        isSuggestionEnabled = true
    }
    
    func removeBinding() {
        isSuggestionEnabled = false
    }
    
    func getIsSuggestionEnabled() -> Bool {
        return isSuggestionEnabled
    }
    
    func addSuggesion(str: String?) {
        let result = str ?? ""
        if !result.isEmpty {
            LocalDB.shared.addSuggestion(str: result)
            initialize()
        }
    }
    
    func getSuggesionsList() -> [String] {
        return suggestionsList
    }
    
}
