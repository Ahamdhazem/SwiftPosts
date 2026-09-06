//
//  MainCellViewModel.swift
//  PostsApp
//
//  Created by LP Mackbook on 02/09/2026.
//

import Foundation
import UIKit


class MainCellViewModel{
    



    let uiImage :UIImage!
    let title : String!
    let indexPath :IndexPath!
    let index : Int!
    let screenName:EnumScreens!
    init(_ indexPath : IndexPath) {
        self.indexPath = indexPath
        
        index = indexPath.section * 2 + indexPath.item
        
        self.screenName = self.index == 0 ? .posts :
                          self.index == 1 ? .todos :
                          .users
        
        var imageName : String!
        
        imageName = index == 0 ?  "doc.text" :
                    index == 1 ?  "checkmark.circle" :
                    "person.3"
        
        uiImage = UIImage(systemName: imageName)
        
        title = CellList[index]

    }

 
    
 
    

}
