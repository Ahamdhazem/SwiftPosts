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

struct User : Codable {
    
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    
 

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

