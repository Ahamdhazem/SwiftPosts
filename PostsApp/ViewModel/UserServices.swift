//
//  UserServeses.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import Foundation
import Alamofire
class UserServeses {
    
     let url = "https://jsonplaceholder.typicode.com/users/"

    func GetUsers()  async ->  [User]  {
        do {
            
            let users = try await  AF.request(
                self.url
                ,method: .get)
                .serializingDecodable([User].self)
                .value
            
                return users
       
        } catch{
            print(error)
            return []
        }
          

    }
    
    func GetUserByID(_ id : Int)  async throws -> User {
       
            
            let user = try await  AF.request(
                self.url+String(id)
                ,method: .get)
                .serializingDecodable(User.self)
                .value
                return user
    }
    
    
}
