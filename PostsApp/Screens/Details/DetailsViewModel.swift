//
//  PosDetailsViewModel.swift
//  PostsApp
//
//  Created by LP Mackbook on 04/09/2026.
//

import Foundation


class DetailsViewModel{
    var service : DetailsServices!
    var id : Int!
    var post : Post?
    var onuserLoad :( ()->Void)!
    var user : User?
    {didSet{
        onuserLoad?()
    }}
    var todo : ToDo?
    
    init(_ data : BaseModel , _  screen : EnumScreens ) {
//        Task{
//            user = Loaduser(data.id)
//        }
        Task{
            switch screen  {
            case .posts: await SetPost(data)
            case .users:  SetUser(data)
            case .todos: await SetTodo(data)
                
            }
        }
        
        
    }
     
    func LoadUser (_ id : Int) async -> User?{
        let userServies = DetailsServices()
        return await userServies.FetchData("users/"+String(id))
    }
    
    func SetPost(_ data : BaseModel ) async {
        guard let post = data as? Post  else {return }
        self.post = post
            if let lodedUser = await LoadUser(post.userId) {
                self.user = lodedUser
            } else {
                print("error while loading the User")
            }

  
    }
    func SetTodo(_ data : BaseModel ) async  {
    guard let todo = data as? ToDo  else {return }
        self.todo = todo
        if let lodedUser = await LoadUser(todo.userId) {
            self.user = lodedUser
        } else {
            print("error while loading the User")
        }
    }
    func SetUser(_ data : BaseModel )  {
     guard let user = data as? User  else {return }
        self.user = user
        
    }
    
}


