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
    
    var viewModel : UserPostTodoViewModel!
    
    override func viewDidLoad  ()  {
        super.viewDidLoad()
        
        //taitelLabel.text = screenName.rawValue
        TabelViewRegister()
        Task {
            await LoadTabelView()
        }
        
        
    }
    func TabelViewRegister () {
        let nib = UINib(nibName: "UserPostTodoTableViewCell", bundle: nil)
        
        tabelView.register(
            nib,
            forCellReuseIdentifier: "UserPostTodoTableViewCell"
        )
    }

    
    var data = Generic<Any>()
    
    func LoadTabelView () async {
        self.data.genericDictinary = await viewModel.LoadTabelView()
        tabelView.reloadData()
    }
    
}
    
    extension UserPostToDoViewController:UITableViewDataSource{
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            
            return self.data.genericDictinary.count
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tabelView.dequeueReusableCell(withIdentifier: "UserPostTodoTableViewCell", for: indexPath) as! UserPostTodoTableViewCell
            
           
            if(data.genericDictinary is [Post]){
                 
                cell.label.text = (data.genericDictinary as! [Post] as [Post])[indexPath.section].title
                cell.id = (data.genericDictinary as! [Post] as [Post])[indexPath.section].id
                
            }else if(data.genericDictinary is [User]){
                cell.label.text = (data.genericDictinary as! [User] as [User])[indexPath.section].name
                cell.id = (data.genericDictinary as! [User] as [User])[indexPath.section].id

                
            }else  if(data.genericDictinary is [ToDo]){
                cell.label.text = (data.genericDictinary as! [ToDo] as [ToDo])[indexPath.section].title
                cell.id = (data.genericDictinary as! [ToDo] as [ToDo])[indexPath.section].id
            }
            
            

            
            return cell
        }
        
        
    }

extension UserPostToDoViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       let cell =  tableView.cellForRow(at: indexPath) as! UserPostTodoTableViewCell
        
////        var viewMode : UserPostTodoViewModel!
//        let vc = UserPostToDoDetailsViewController(screenName: self.screenName , id: cell.id)
//       // vc.viewMode = UserPostTodoViewModel(UserPostTodoViewModel)
//        vc.modalPresentationStyle =  .fullScreen
//        present(vc, animated: true)
        
    
     
    }
}
    

