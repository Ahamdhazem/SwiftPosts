//
//  UserPostToDoViewController.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import UIKit

class UserPostToDoViewController: UIViewController {
    // @IBOutlet var view: UIView!
    @IBOutlet var taitelLabel: UILabel!
    
    @IBOutlet var tabelView: UITableView!
    var users: [User]?
    var posts: [Post]?
    var todos: [ToDo]?
    
   var userServese  :  UserServeses?
   var postsServese :  PostServeses?
   var todosServese :  ToDoServeses?
    
    var screenName : EnumScreens
    init(screenName: EnumScreens)  {
        self.screenName = screenName
        super.init(nibName: "UserPostToDoViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad  ()  {
        super.viewDidLoad()
        
        taitelLabel.text = screenName.rawValue

        TabelViewRegister()
        Task {
            await LoadTabelView()
        }

        
    }
    
    func LoadTabelView () async {
        
        switch (self.screenName){
            
        case .posts : await LoadPosts()
        case .users : await LoadUsers()
        case .todos : await LoadTodos()
            
        }
        
        tabelView.reloadData()
    }
    
    
    func TabelViewRegister () {
        let nib = UINib(nibName: "UserPostTodoTableViewCell", bundle: nil)
        
        tabelView.register(
            nib,
            forCellReuseIdentifier: "UserPostTodoTableViewCell"
        )
    }
    
    func LoadUsers() async {
        self.userServese = UserServeses()
        self.users = await self.userServese?.GetUsers()
    }
    func LoadPosts() async {
        self.postsServese = PostServeses()
        self.posts = await self.postsServese?.GetPosts()
            
    }
    
    func LoadTodos() async {
        self.todosServese = ToDoServeses()
        todos = await self.todosServese?.GetTodos()
    }
    
}
    
    extension UserPostToDoViewController:UITableViewDataSource{
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            
            switch (screenName){
            case .posts:
                    return self.posts?.count ?? 0
                case .users:
                    return self.users?.count ?? 0
                case .todos:
                    return self.todos?.count ?? 0
            }
            
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tabelView.dequeueReusableCell(withIdentifier: "UserPostTodoTableViewCell", for: indexPath) as! UserPostTodoTableViewCell
            
            switch (screenName){
            case .posts :  cell.label.text = posts?[indexPath.section].title
            case .users :  cell.label.text = users?[indexPath.section].name
            case .todos :  cell.label.text = todos?[indexPath.section].title
            }
            
            return cell
        }
        
        
    }

extension UserPostToDoViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = UserPostToDoDetailsViewController(screenName: self.screenName)
        
        present(vc, animated: true)
     
    }
}
    

