//
//  UserPostToDoViewController.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import UIKit


class ContentViewController: UIViewController {
    // @IBOutlet var view: UIView!
    var viewModel : ContentViewModel!
    @IBOutlet var headTitle: UILabel!
    @IBOutlet var taitelLabel: UILabel!
    @IBOutlet var tabelView: UITableView!
    var data : [BaseModel] = []

    
    override func viewDidLoad  ()  {
        super.viewDidLoad()
        set()
        viewModel.loadData()
        tabelViewRegister()
        
    }
    
    private func setupBindings() {

    }
    func set(){
        self.headTitle.text = viewModel.screenName.rawValue
        viewModel.onDataUpdated = { [weak self] in
            self?.data = self?.viewModel.data ?? []
            self?.tabelView.reloadData()
        }
      
    }
    func tabelViewRegister () {
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
            
            let data =  data[indexPath.section]
            cell.configure(vm: ContentCellViewModel(data , data.id , viewModel.screenName ))
//            cell.viewModel = ContentCellViewModel(data , data.id , viewModel.screenName )
           // cell.Set()
            
            return cell

        }
        
        
    }

extension ContentViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        vc.viewModel = DetailsViewModel(data[indexPath.section], viewModel.screenName)

        vc.modalPresentationStyle =  .fullScreen
        present(vc, animated: true)
       
    
     
    }
    

}

extension ContentViewController:UICollectionViewDelegateFlowLayout{}





