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

struct ToDo : Codable {
    let userId    : Int
    let id        : Int
    let title     : String
    let completed : Bool
}
