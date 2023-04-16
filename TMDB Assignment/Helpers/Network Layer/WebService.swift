//
//  WebService.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation

class APIGeneric<response: Codable> {
    
    static func fetchRequest(apiURL:String , requestType: RequestType = .get,  onCompletion: @escaping (Result<response,Error>) -> Void) {
        print(apiURL)
        NetworkService.shared.fetchData(requestType: requestType, fromURL: apiURL, parameters: [:]) { (error:Error?, jsonData:Data?, statusCode: Int?) in
            
            if let err = error {
                let errr = CustomError(description: err.localizedDescription)
                onCompletion(.failure(errr))
            }else{
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData!, options: [])
                    print(jsonResponse)

                    if statusCode == 200 {
                        let responseModel = try JSONDecoder().decode(response.self, from: jsonData!)
                        onCompletion(.success(responseModel))
                    } else {
                        let responseModel = try JSONDecoder().decode(APIErrorModel.self, from: jsonData!)
                        let error = CustomError(description: responseModel.statusMessage ?? "")
                        onCompletion(.failure(error))
                    }
                } catch let error {
                    let err = CustomError(description: error.localizedDescription)
                    onCompletion(.failure(err))
                }
            }
        }
    }
}
