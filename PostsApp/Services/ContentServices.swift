//
//  PostServeses.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import Foundation

import Alamofire

class ContentServeses {

    
    let url = "https://jsonplaceholder.typicode.com/"
    
    
    
    func FetchData<T: Decodable>(_ urlExtension: String) async -> [T] {
            do {
                let data = try await AF.request(
                    url + urlExtension,
                    method: .get
                )
                .serializingDecodable([T].self)
                .value

                return data
            } catch {
                print("error \(T.self):", error)
                return []
            }
        }
    
}
