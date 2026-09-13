//
//  BaseModel.swift
//  PostsApp
//
//  Created by LP Mackbook on 02/09/2026.
//

import Foundation

class BaseModel:Decodable{
    
 
    let id : Int!
    enum CodingKeys: String, CodingKey {
        case id

    }
    required init(from decoder: Decoder) throws {
        
                let container = try decoder.container(
                keyedBy: CodingKeys.self
                )
        
                self.id = try container.decode(
                    Int.self,
                    forKey: .id
                )
    }

}
    
