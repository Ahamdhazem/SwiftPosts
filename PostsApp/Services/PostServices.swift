//
//  PostServeses.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import Foundation

import Alamofire

class PostServeses {

//     Get Rquest  https://jsonplaceholder.typicode.com/posts
    
    let url = "https://jsonplaceholder.typicode.com/posts/"
    
    func GetPosts()  async -> [Post] {
        do {
            let posts = try await  AF.request(
                url
                ,method: .get)
                .serializingDecodable([Post].self)
                .value

                return posts
    } catch{
        print(error)
        return []
    }
        
    }
    
    
    func GetPostByID(_ id : Int)  async throws-> Post {
        
            let post = try await  AF.request(
                url+String(id)
                ,method: .get)
                .serializingDecodable(Post.self)
                .value

                return post
    }
    
}
