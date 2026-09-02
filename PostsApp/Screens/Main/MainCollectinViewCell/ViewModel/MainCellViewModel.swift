//
//  MainCellViewModel.swift
//  PostsApp
//
//  Created by LP Mackbook on 02/09/2026.
//

import Foundation
import UIKit


class MainCellViewModel{
    

    @IBOutlet var titel: UILabel!
    @IBOutlet var image: UIImageView!

    
    let indexPath :IndexPath!
    let index : Int!
    init(_ indexPath : IndexPath) {
        self.indexPath = indexPath
        index = indexPath.section * 2 + indexPath.item
    }
    func SetImager() -> UIImage! {
       
        switch index {
        case 0:
            return UIImage(systemName: "doc.text")
            
        case 1:
            return UIImage(systemName:"checkmark.circle" )
            
        case 2:
            return UIImage(systemName: "person.3")
        default: return UIImage(systemName: "checkmark.circle")
        }
        
    }
    
    func setTitel () -> String {
        
        return CellList[index]
    }

}
