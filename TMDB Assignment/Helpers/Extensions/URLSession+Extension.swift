//
//  URLSession+Extension.swift
//  TMDB Assignment
//
//  Created by Ahmad on 16/04/2023.
//

import Foundation

extension URLSession {
    
    func cancelRequest(withURL urlString:String) -> Void {
        session.getAllTasks { (sessionTasksList) in
            sessionTasksList.forEach({ (sessionTask) in
                if let url = sessionTask.originalRequest?.url {
                    if url.absoluteString.contains(urlString) {
                        sessionTask.cancel()
                    }
                }
            })
        }
    }
}
