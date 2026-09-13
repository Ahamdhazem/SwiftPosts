//
//  CellViewModel.swift
//  PostsApp
//
//  Created by LP Mackbook on 02/09/2026.
//

import Foundation

class ContentCellViewModel{
    let id : Int!
    let data : BaseModel!
    let screen : EnumScreens!
    init( _ data : BaseModel , _ id : Int , _ screen : EnumScreens){
        self.id = id
        self.data = data;
        self.screen = screen
        
        }

        
}
