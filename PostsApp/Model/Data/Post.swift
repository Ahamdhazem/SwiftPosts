//
//  Post.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import Foundation

//example
//[
//  {
//    "userId": 1,
//    "id": 1,
//    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//},.....]

struct Post : Codable {
 let  userId : Int
 let  id     : Int
 let  title  : String
 let  body   : String
    
}
