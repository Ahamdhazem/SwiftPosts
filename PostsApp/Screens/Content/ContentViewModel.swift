//
//  UserPostTodoViewModel.swift
//  PostsApp
//
//  Created by LP Mackbook on 27/08/2026.
//

import Foundation

class ContentViewModel {
    
    let screenName:EnumScreens!
    var onDataUpdated : (() -> Void)!
    var data : [BaseModel] = []{
        didSet{
            onDataUpdated?()
        }
    }
    
    let servies : ContentServeses!
    
    init(secreenName : EnumScreens){
        self.screenName = secreenName
         servies = ContentServeses()
 
        }
        
        
        func loadData(){
            Task {
                let fetchedData = await loadTabelView()
                await MainActor.run {
                    self.data = fetchedData
                }
        }
        
        
        func loadUsers() async -> [User]{
            return await self.servies.FetchData("users")
        }
        func loadPosts() async ->[Post]{
            return await self.servies.FetchData("posts")
        }
        func loadTodos() async ->[ToDo]{
            return await self.servies.FetchData("todos")
        }
        
        func loadTabelView() async -> [BaseModel]{
            switch screenName {
            case .posts: return await loadPosts()
            case .users: return await loadUsers()
            case .todos: return await loadTodos()
            default:
                print("default")
            }
            
            return [] as! [BaseModel]
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
}
