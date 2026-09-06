//
//  User.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import Foundation

//example
//[
//    {
//    "id": 1,
//    "name": "Leanne Graham",
//    "username": "Bret",
//    "email": "Sincere@april.biz",
//    "address": {
//        "street": "Kulas Light",
//        "suite": "Apt. 556",
//        "city": "Gwenborough",
//        "zipcode": "92998-3874",
//        "geo": {
//            "lat": "-37.3159",
//            "lng": "81.1496"
//        }
//    }, ..... ]

class User : BaseModel {
    
    let id: Int!
    let name: String!
    let username: String!
    let email: String!
    let address: Address!
    
    enum CodingKeys: String, CodingKey {
            case id
            case name
            case username
            case email
            case address
        }

        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            self.id = try container.decode(Int.self, forKey: .id)
            self.name = try container.decode(String.self, forKey: .name)
            self.username = try container.decode(String.self, forKey: .username)
            self.email = try container.decode(String.self, forKey: .email)
            self.address = try container.decode(Address.self, forKey: .address)

            try super.init(from: decoder)
        }
}



struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat: String
    let lng: String
}

