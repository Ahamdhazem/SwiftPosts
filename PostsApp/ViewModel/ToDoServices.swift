//
//  ToDoServeses.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import Foundation
import Alamofire

class ToDoServeses  {
    // Get All Todos https://jsonplaceholder.typicode.com/todos
    
    let url = "https://jsonplaceholder.typicode.com/todos/"
    
    func GetTodos()  async  -> [ToDo] {
        do {
            let todos = try await  AF.request(
                url
                ,method: .get)
                .serializingDecodable([ToDo].self)
                .value
                return todos
        
        } catch{
            print(error)
            return []
        }
            
       

    }
    
    func GetTodoByID(_ id :Int)  async throws -> ToDo {
            
            let todo = try await  AF.request(
                url+String(id)
                ,method: .get)
                .serializingDecodable(ToDo.self)
                .value
                return todo

    }
    
}
