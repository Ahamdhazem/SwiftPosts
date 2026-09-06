//
//  UserDetailsViewController.swift
//  PostsApp
//
//  Created by LP Mackbook on 06/09/2026.
//

import UIKit

class UserDetailsViewController: BaseDetailsSecreen {
    
  
    @IBOutlet var username: UILabel!
    
    @IBOutlet var zipcoode: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var email: UILabel!
    @IBAction func GoBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.username.text = viewModel.user?.username ?? "username"
        self.email.text = viewModel.user?.email ?? "email"
        self.city.text = viewModel.user?.address.city ?? "city"
        self.zipcoode.text = viewModel.user?.address.zipcode ?? "zipcode"
        
    }



}
