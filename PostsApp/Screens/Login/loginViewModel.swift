//
//  AccountList.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import Foundation
class loginViewModel {
    
    public var accounts: [Account] = []
    public func loadAccounts() {
        self.accounts =  [
            Account(userName: "Ahmad", passward: "123"),
            Account(userName: "Rami", passward: "111"),
            Account(userName: "Ali", passward: "232")
        ]
        
    }
    
    func login (_ userName : String , _ passward : String) -> Bool {
        return accounts.contains { account in account.userName == userName && account.passward == passward }
    }
    

}
