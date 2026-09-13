//
//  DetailsViewController.swift
//  PostsApp
//
//  Created by LP Mackbook on 08/09/2026.
//

import UIKit

class DetailsViewController: UIViewController {
    var viewModel: DetailsViewModel!
    @IBOutlet var tabelView: UITableView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var label: UILabel!
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
        tabelViewRegisteration ()
    }
    

    
    func tabelViewRegisteration () {
        let nib = UINib(nibName: "DetailsTableViewCell", bundle: nil)
        
        tabelView.register(
            nib,
            forCellReuseIdentifier: "DetailsTableViewCell"
        )
    }

    
    func set(){
        viewModel.onCommentsLoad = { [weak self] in
                DispatchQueue.main.async {
                    self?.tabelView.reloadData()
                }
            }
        
        viewModel.onuserLoad =  { [weak self] in
            DispatchQueue.main.async {
                self?.userName.text = self?.viewModel?.user?.username ?? "UserName"
            }
        }
        switch viewModel.screen  {
        case .posts:  setPost()
        case .users:  setUser()
        case .todos:  setTodo()
        case .none: print("none")
        }
    }
    
    func setPost(){
        label?.text = viewModel?.post?.body ?? "Post Body"
    }
    
    func setUser(){
        label.isHidden = true;
        
        self.userName.text = viewModel?.user?.username ?? "userName"
        }
    
        func setTodo(){
            label?.text = viewModel?.todo?.title ?? "todoTitel"
        }
}

extension DetailsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(viewModel.screen){
        case .posts: return viewModel.comments?.count ?? 1
        case .users: return 3
        case .todos: return 1
        case .none: return 1
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as! DetailsTableViewCell
        switch viewModel.screen {
                case .posts:
                    if let comment = viewModel.comments?[indexPath.row] {
                        cell.set ("", comment.body)
                    }
                    
                case .users:
                    if let user = viewModel.user {
                        switch indexPath.row {
                        case 0:
                            cell.set("Email", user.email ?? "")
                        case 1:
                            cell.set("City", user.address?.city ?? "")
                        case 2:
                            cell.set("Zipcode", user.address?.zipcode ?? "")
                        default:
                            break
                        }
                    }
                    
        case .todos:
                    if let todo = viewModel.todo {
                        let status = todo.completed ? "Completed" : "Pending"
                        cell.set("Status", status)
                    }
                    
                case .none:
                    break
                }
        return cell
    }
    
}
