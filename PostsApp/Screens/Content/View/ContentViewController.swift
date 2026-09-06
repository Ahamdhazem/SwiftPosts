//
//  UserPostToDoViewController.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import UIKit


class ContentViewController: UIViewController {
    // @IBOutlet var view: UIView!
    @IBOutlet var HeadTitle: UILabel!
    @IBOutlet var taitelLabel: UILabel!
    
    @IBOutlet var tabelView: UITableView!
    var data : [BaseModel] = []
    var viewModel : ContentViewModel!
    
    override func viewDidLoad  ()  {
        super.viewDidLoad()
        Set()
        viewModel.LoadData()
        TabelViewRegister()
        
    }
    
    private func setupBindings() {

    }
    func Set(){
        self.HeadTitle.text = viewModel.screenName.rawValue
        viewModel.onDataUpdated = { [weak self] in
            self?.data = self?.viewModel.data ?? []
            self?.tabelView.reloadData()
        }
      
    }
    func TabelViewRegister () {
        let nib = UINib(nibName: "ContentCell", bundle: nil)
        
        tabelView.register(
            nib,
            forCellReuseIdentifier: "ContentCell"
        )
    }


    
}
    
    extension ContentViewController:UITableViewDataSource{
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            
            return self.data.count 
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            

            
            let cell = tabelView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ContentCell
            
            
            
            cell.viewModel = ContentCellViewModel(data[indexPath.section])
            cell.Set()
            
            return cell

        }
        
        
    }

extension ContentViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

       
        let vc : BaseDetailsSecreen!
        switch (viewModel.screenName){
        case .posts:   vc = PostDetailsViewController()
        case .users:   vc = UserDetailsViewController()
        case .todos:   vc = ToDoDetailsViewController()
        case .none: vc = BaseDetailsSecreen()
            
        }
        vc.viewModel = DetailsViewModel(data[indexPath.section], viewModel.screenName)
        vc.modalPresentationStyle =  .fullScreen
        present(vc, animated: true)
       
    
     
    }
    

}





