//
//  ToDo.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import Foundation

//example
//
//[
//  {
//    "userId": 1,
//    "id": 1,
//    "title": "delectus aut autem",
//    "completed": false
//},......]

class ToDo : BaseModel {
    let userId    : Int!
    let id        : Int!
    let title     : String!
    let completed : Bool!
    
    enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case completed
    }
    required init(from decoder: Decoder) throws {

        let container = try decoder.container(
        keyedBy: CodingKeys.self
        )

        self.userId = try container.decode(
            Int.self,
            forKey: .userId
        )

        self.id = try container.decode(
            Int.self,
            forKey: .id
        )

        self.title = try container.decode(
            String.self,
            forKey: .title
        )

        self.completed = try container.decode(
            Bool.self,
            forKey: .completed
        )

        try super.init(from: decoder)
    }


}
