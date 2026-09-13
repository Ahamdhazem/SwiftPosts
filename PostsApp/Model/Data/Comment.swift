//
//  Comment.swift
//  PostsApp
//
//  Created by LP Mackbook on 09/09/2026.
//
//
//{
//  "postId": 1,
//  "id": 1,
//  "name": "id labore ex et quam laborum",
//  "email": "Eliseo@gardner.biz",
//  "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
//},

import Foundation

class Comment:BaseModel {
    let postId : Int!
    let name   : String!
    let email  : String!
    let body   : String!
    
    enum CodingKeys: String, CodingKey {
        case postId
        case name
        case email
        case body
    }
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(
            keyedBy: CodingKeys.self
        )
        
        self.postId = try container.decode(
            Int.self,
            forKey: .postId
        )
        self.name = try container.decode(
            String.self,
            forKey: .name
        )
        self.email = try container.decode(
            String.self,
            forKey: .email
        )
        self.body = try container.decode(
            String.self,
            forKey: .body
        )
        
        try super.init(from: decoder)
    }
    
}
