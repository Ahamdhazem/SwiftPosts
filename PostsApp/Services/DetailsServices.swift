//
//  ToDoServeses.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import Foundation
import Alamofire

class DetailsServices  {
    // Get All Todos https://jsonplaceholder.typicode.com/todos
    
    let url = "https://jsonplaceholder.typicode.com/"
    
    func FetchData<T : Decodable> (_ urlExtention : String ) async -> T? {
        
        do {
            let T = try await  AF.request(
                url+urlExtention
                ,method: .get)
                .serializingDecodable(T.self)
                .value
            return T

    } catch {
            print("Fetch error: \(error)")
            return nil
        }
    }
    
}
