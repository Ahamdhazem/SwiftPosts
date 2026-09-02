//
//  CellViewModel.swift
//  PostsApp
//
//  Created by LP Mackbook on 02/09/2026.
//

import Foundation

class ContentCellViewModel{
    let id:Int!
    let title:String!
    let subTitle:String!

    
    init( _ data : BaseModel){
    
        if (data is Post){
            let post = (data as!Post)
            self.id = post.id
            self.title = post.title.isEmpty ? "Title" : post.title
            self.subTitle = post.body
            
        }else if (data is User){
            let user = (data as!User)
            self.id = user.id
            self.title = user.username
            self.subTitle = user.email
        }
        else {
            let todo = (data as!ToDo)
            self.id = todo.id
            self.title = todo.completed ? "✅ Completed" : "❌ Not Completed"
            self.subTitle = todo.title
        }
         
        
    }
    
    
    
    
    
    
    
    
    
    
//    if(data is [Post]){
//         
//        self.label.text = (data as! [Post] as [Post])[index].title
//        self.id = (data as! [Post] as [Post])[index].id!
//        
//    }else if(data is [User]){
//        self.label.text = (data as! [User] as [User])[index].name
//        self.id = (data as! [User] as [User])[index].id!
//
//        
//    }else  if(data is [ToDo]){
//        self.label.text = (data as! [ToDo] as [ToDo])[index].title
//        self.id = (data as! [ToDo] as [ToDo])[index].id!
//    }
//    
//}
    
}
