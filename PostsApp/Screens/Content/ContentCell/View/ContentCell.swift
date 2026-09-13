

import UIKit

class ContentCell: UITableViewCell {
    
    @IBOutlet var userInfo: UIView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var Title: UILabel!
    @IBOutlet var SubTitle: UILabel!
    var viewModel : ContentCellViewModel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(vm: ContentCellViewModel){
        viewModel = vm
        set()
    }
    
    func set(){
        switch(viewModel.screen){
        case .posts:  setPost()
        case .users:  setUser()
        case .todos:  setTodo()
        case .none:  print("none")
        }
    }
    
//    func SetUserInfo(){
//     
//    }
    
    func setUser(){
        guard let user = viewModel.data as? User else {return}
        self.userName.text = user.username
        SubTitle.isHidden = true
    }
    
    func setPost(){
        guard let post = viewModel.data as? Post else {return}
        self.SubTitle.text = post.body
        //SetUserInfo()
//        self.userName.text = viewModel.user?.username ?? "userName"
    }
    
    func setTodo(){
        guard let todo = viewModel.data as? ToDo else {return}
        self.SubTitle.text = String(todo.completed ?  "✅  " : "⬜  ") + todo.title 
        self.userInfo.isHidden = true
    }

    
}
