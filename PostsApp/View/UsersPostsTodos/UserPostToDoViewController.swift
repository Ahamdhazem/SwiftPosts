//
//  UserPostToDoViewController.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import UIKit

class UserPostToDoViewController: UIViewController {
    @IBOutlet var taitelLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var titleText : String = "terst"
    init(titleText: String) {
//        self.titleText = titleText
        switch titleText{
        case "Posts":
            print("Posts")
        case "ToDos":
            print("ToDos")
        case "Users":
            print("Users")
        default:
            print("defale")
        }
        super.init(nibName: "UserPostToDoViewController", bundle: nil)
      }
      
      required init?(coder: NSCoder) {
          fatalError("")
      }


 

}
