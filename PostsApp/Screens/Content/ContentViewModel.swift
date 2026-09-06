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
    
    let Servies : ContentServeses!
    init(secreenName : EnumScreens){
        self.screenName = secreenName
         Servies = ContentServeses()
 
        }
        
        
        func LoadData(){
            Task {
                let fetchedData = await LoadTabelView()
                await MainActor.run {
                    self.data = fetchedData
                }
        }
        
        
        func LoadUsers() async -> [User]{
            return await self.Servies.FetchData("users")
        }
        func LoadPosts() async ->[Post]{
            return await self.Servies.FetchData("posts")
        }
        func LoadTodos() async ->[ToDo]{
            return await self.Servies.FetchData("todos")
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
    
    
    
    
    
    
    
}
