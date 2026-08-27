//
//  AccountList.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import Foundation
class AccountViewModel {
    
    public var accounts: [Account] = []
    public func LoadAccounts() {
        self.accounts =  [
            Account(userName: "Ahmad", passward: "123"),
            Account(userName: "Rami", passward: "111"),
            Account(userName: "Ali", passward: "232")
        ]
        
    }
    

}
