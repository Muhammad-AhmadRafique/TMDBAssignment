//
//  FavoriteMoviesDB.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation


struct FavoriteMoviesListDB {
    
    static let instance = FavoriteMoviesListDB()
    
    private let defaults = UserDefaults.standard
    
    func saveData(model:FavoriteMoviesListModel) -> Void {
        
        let defaults = UserDefaults.standard
        defaults.set(try? PropertyListEncoder().encode(model), forKey: "\(FavoriteMoviesListDB.self)")
        
    }
    
    func fetchData() -> FavoriteMoviesListModel? {
        
        let defaults = UserDefaults.standard
        
        if let data = defaults.object(forKey: "\(FavoriteMoviesListDB.self)") as? Data{
            if let staticModel = try? PropertyListDecoder().decode(FavoriteMoviesListModel.self, from: data) {
                return staticModel
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}


struct FavoriteMoviesListModel : Codable {
    let list : [MovieModel]?
}
