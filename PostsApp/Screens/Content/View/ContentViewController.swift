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
    
    var viewModel : ContentViewModel!
    
    override func viewDidLoad  ()  {
        super.viewDidLoad()
        Set()
        TabelViewRegister()
        Task {
            await LoadTabelView()
            tabelView.reloadData()
        }
        
        
    }
    func Set(){
        self.HeadTitle.text = viewModel.screenName.rawValue
    }
    func TabelViewRegister () {
        let nib = UINib(nibName: "ContentCell", bundle: nil)
        
        tabelView.register(
            nib,
            forCellReuseIdentifier: "ContentCell"
        )
    }

    
    var data : [BaseModel] = []
    
    func LoadTabelView () async {
        self.data = await viewModel.LoadTabelView()
        tabelView.reloadData()
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
        
        //viewModel.screenName
        
//        let vc =  DetailsViewController(nibName: "DetailsViewController", bundle: nil)
//      //DetailsViewController  vc.viewModel = UserPostTodoViewModel(secreenName: secreenName)
//        navigationController?.pushViewController(vc, animated: true)
        
    
     
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
//        
//        //tabelView.reloadData()
//    }
////    
//    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        tabelView.reloadData()
//    }
}
    


