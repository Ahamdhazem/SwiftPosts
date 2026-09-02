//
//  UserPostTodoViewModel.swift
//  PostsApp
//
//  Created by LP Mackbook on 27/08/2026.
//

import Foundation

class ContentViewModel {

    var screenName:EnumScreens!
    
    init(secreenName : EnumScreens){
        self.screenName = secreenName
    }
    
    

    func LoadUsers() async -> [User]{
        let userServese  = UserServeses()
        let users = await userServese.GetUsers()
        return users
    }
    func LoadPosts() async ->[Post]{
        let postsServese = PostServeses()
        let posts = await postsServese.GetPosts()
        return posts
    }
    func LoadTodos() async ->[ToDo]{
        let todosServese = ToDoServeses()
        let todos = await todosServese.GetTodos()
        return todos
    }
    
    func LoadTabelView() async -> [BaseModel]{
        switch screenName {
        case .posts: return await LoadPosts()
        case .users: return await LoadUsers()
        case .todos: return await LoadTodos()
        default:
            print("default")
        }
        
        return [] as! [BaseModel]

    }
    
    

        
    }
    
    

    

    

