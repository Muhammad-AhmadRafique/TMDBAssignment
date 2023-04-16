//
//  LocalCache.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation

class LocalDB {
    
    static let shared = LocalDB()
    
    private var favoritesList = [MovieModel]()
    private var suggestionsList = [String]()
    
    private init() {
        
        if let moviesListModel = FavoriteMoviesListDB.instance.fetchData() {
            self.favoritesList = moviesListModel.list ?? []
        }
        
        if let suggestionList = SuggestionListDB.instance.fetchData() {
            self.suggestionsList = suggestionList.suggestion ?? []
        }
    }

}

//MARK: - Favorite Movies

extension LocalDB {
    func markFavorite(model: MovieModel) {
       if let moviesListModel = FavoriteMoviesListDB.instance.fetchData() {
           
           var list = moviesListModel.list ?? []

           if let index = list.lastIndex(where: {$0.id == model.id}) {
               var updatedModel = list[index]
               var isFavorite = updatedModel.isFavorite ?? false
               isFavorite = !isFavorite
               updatedModel.isFavorite = isFavorite
               list[index] = updatedModel
           } else {
               var updatedModel = model
               updatedModel.isFavorite = true
               list.append(updatedModel)
           }
           
           //updating local list
           self.favoritesList = list

           let updatedRecord = FavoriteMoviesListModel(list: list)
           FavoriteMoviesListDB.instance.saveData(model: updatedRecord)
       } else {
           var list = [MovieModel]()
           var updatedModel = model
           updatedModel.isFavorite = true
           list.append(updatedModel)
           
           //updating local list
           self.favoritesList = list
           
           let updatedRecord = FavoriteMoviesListModel(list: list)
           FavoriteMoviesListDB.instance.saveData(model: updatedRecord)
       }
   }

   func getFavoritesList() -> [MovieModel] {
       return self.favoritesList.filter({$0.isFavorite ?? false})
   }
   
   func checkIsFavorite(model: MovieModel) -> Bool {
       if let model = self.favoritesList.filter({$0.id == model.id}).first {
           return model.isFavorite ?? false
       } else {
           return false
       }
   }
}

//MARK: - Suggestions
extension LocalDB {
    func getSuggestionList() -> [String] {
        return suggestionsList
    }
    
    func addSuggestion(str: String) {
        var list = [String]()
        if let suggesionsModel = SuggestionListDB.instance.fetchData() {
            list = suggesionsModel.suggestion ?? []
        } else {
            list = [String]()
            
        }
        
        let updatedModel = str
        if !list.contains(str) {
            list.insert(updatedModel, at: 0)
        }
        
        //mainting only latest 10 entries
        if list.count > 10 {
            list = Array(list.prefix(10))
        }
        
        //updating local list
        self.suggestionsList = list
        
        let updatedRecord = SuggestionsListModel(suggestion: list)
        SuggestionListDB.instance.saveData(model: updatedRecord)
        
    }
}
