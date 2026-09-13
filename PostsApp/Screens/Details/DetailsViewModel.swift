//
//  PosDetailsViewModel.swift
//  PostsApp
//
//  Created by LP Mackbook on 04/09/2026.
//

import Foundation


class DetailsViewModel{
    var service : DetailsServices!
    var post : Post?
    var onCommentsLoad : (()->Void)!
    var comments : [Comment]?{
        didSet{
            onCommentsLoad?()
        }
    }
    var onuserLoad :( ()->Void)!
    var user : User?
    {didSet{
        onuserLoad?()
    }}
    var todo : ToDo?
    
    let data : BaseModel!
    let screen : EnumScreens!
    init(_ data : BaseModel , _  screen : EnumScreens ) {
        self.data = data
        self.screen = screen
        Task{
            switch screen  {
            case .posts: await  setPost(data)
            case .users:  setUser(data)
            case .todos:  await setToDo(data)
                
            }
        }
        
        
    }
     
    func loadUser (_ id : Int) async -> User?{
        let userServies = DetailsServices()
        return await userServies.FetchData("users/"+String(id))
    }
    func loadCommetns (_ postID : Int) async -> [Comment]?{
        let userServies = ContentServeses()
        return await userServies.FetchData("posts/"+String(postID)+"/comments")
    }
    
    func setPost(_ data : BaseModel ) async {
        guard let post = data as? Post  else {return }
        self.post = post
        if let lodedUser = await loadUser(post.userId) {
            self.user = lodedUser
        } else {
            print("error while loading the User")
            return
        }
        if let loadedComments = await loadCommetns(post.id) {
            self.comments = loadedComments
        } else {
            print("error while loading the comments")
            return
        }
        

        

  
    }
    func setToDo(_ data : BaseModel ) async  {
    guard let todo = data as? ToDo  else {return }
        self.todo = todo
        if let lodedUser = await loadUser(todo.userId) {
            self.user = lodedUser
        } else {
            print("error while loading the User")
        }
    }
    
    func setUser(_ data : BaseModel )  {
     guard let user = data as? User  else {return }
        self.user = user
    }
    
}


