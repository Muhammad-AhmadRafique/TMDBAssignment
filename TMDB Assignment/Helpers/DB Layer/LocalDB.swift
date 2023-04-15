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
    
    private init() {
        
        if let moviesListModel = FavoriteMoviesListDB.instance.fetchData() {
            self.favoritesList = moviesListModel.list ?? []
        }
        
    }
    
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
        return self.favoritesList
    }
    
    func checkIsFavorite(model: MovieModel) -> Bool {
        if let model = self.favoritesList.filter({$0.id == model.id}).first {
            return model.isFavorite ?? false
        } else {
            return false
        }
    }
}