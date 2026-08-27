//
//  UserPostTodoViewModel.swift
//  PostsApp
//
//  Created by LP Mackbook on 27/08/2026.
//

import Foundation

class UserPostTodoViewModel {

    var screenName:EnumScreens!
    
    init(secreenName : EnumScreens){
        self.screenName = secreenName
    }
    
    
   var userServese  = UserServeses()
   var postsServese = PostServeses()
   var todosServese = ToDoServeses()
    
    var users: [User] = []
    var posts: [Post] = []
    var todos: [ToDo] = []
    
    func LoadUsers() async -> [User]{
         users = await userServese.GetUsers()
        return users
    }
    func LoadPosts() async ->[Post]{
        posts = await postsServese.GetPosts()
        return posts
    }
    func LoadTodos() async ->[ToDo]{
        todos = await todosServese.GetTodos()
        return todos
    }
    
   
    
    func LoadTabelView <T>() async -> T {
        
        switch (self.screenName){

        case .posts : return  await LoadPosts() as! T
        case .users : return  await LoadUsers() as! T
        case .todos : return  await LoadTodos() as! T
        case .none:
           return [] as! T
        }
        
    }
    
    

    
//    func LoadUsers() async {
//        self.userServese = UserServeses()
//        self.users = await self.userServese?.GetUsers()
//    }
//    func LoadPosts() async {
//        self.postsServese = PostServeses()
//        self.posts = await self.postsServese?.GetPosts()
//
//    }
//
//    func LoadTodos() async {
//        self.todosServese = ToDoServeses()
//        todos = await self.todosServese?.GetTodos()
//    }
//
//}
    
}
