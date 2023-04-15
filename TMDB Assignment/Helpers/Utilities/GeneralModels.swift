//
//  GeneralModels.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation


struct CustomError: LocalizedError {
    var description: String?

    init(description: String) {
        self.description = description
    }
}

struct NotSuccessModel:Codable {
    let isError: Bool
    let messages: String?
}


// MARK: - ErrorModel
struct APIErrorModel: Codable {
    let statusCode: Int?
    let statusMessage: String?
    let success: Bool?

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}
