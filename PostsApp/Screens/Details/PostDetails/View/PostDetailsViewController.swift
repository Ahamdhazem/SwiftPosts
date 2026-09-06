//
//  PostDetailsViewController.swift
//  PostsApp
//
//  Created by LP Mackbook on 05/09/2026.
//

import UIKit

class BaseDetailsSecreen :  UIViewController{
    var viewModel : DetailsViewModel!
    
}

class PostDetailsViewController: BaseDetailsSecreen{
    
    @IBOutlet var userInfoStack: UIStackView!
    @IBOutlet var mainStackView: UIStackView!
   
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var postBody: UITextView!
    var post : Post!
   
    
    @IBAction func GoBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onuserLoad =  { [weak self] in
            DispatchQueue.main.async {
                    // Safe main-thread UI update
                    self?.userName.text = self?.viewModel.user?.username ?? "UserName"
                }
           // self?.userName.text =  self?.viewModel.user?.username ?? "UserName"
        }
        postBody.text = viewModel.post?.body
        userImage.layer.cornerRadius = 50
        mainStackView.layer.cornerRadius = 12
        mainStackView.clipsToBounds = true
        setupStackViewTap()
        }

        private func setupStackViewTap() {
            userInfoStack.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapStackView))
            userInfoStack.addGestureRecognizer(tapGesture)
        }

        @objc private func didTapStackView() {
            print("Stack view tapped")
            
            let vc = UserDetailsViewController()
            
            guard let user = viewModel.user else {return}
            vc.viewModel = DetailsViewModel(user,.users)
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated:true)
            
        }
    

    

}
