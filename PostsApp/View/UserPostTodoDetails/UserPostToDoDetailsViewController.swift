//
//  UserPostToDoDetailsViewController.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import UIKit

class UserPostToDoDetailsViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var secreenName : EnumScreens
    init(screenName: EnumScreens)  {
        self.secreenName = screenName
        super.init(nibName: "UserPostToDoDetailsViewController", bundle: nil)
        

    }
    
   
    
    required init?(coder: NSCoder) {
            fatalError("")
        }
    
    override func viewDidLoad() {
        self.label.text = secreenName.rawValue
        super.viewDidLoad()
    }


}
