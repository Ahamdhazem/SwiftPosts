//
//  ToDoDetailsViewController.swift
//  PostsApp
//
//  Created by LP Mackbook on 06/09/2026.
//

import UIKit

class ToDoDetailsViewController: BaseDetailsSecreen {

    @IBOutlet var userStack: UIStackView!
    @IBOutlet var username: UILabel!
    
    @IBOutlet var isCompleated: UILabel!
    @IBAction func GoBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBOutlet var taskTitel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.taskTitel.text = viewModel.todo?.title ?? "titel"
        self.isCompleated.text = (viewModel.todo?.completed ?? false) ? "Completed" : "Not Completed"
        self.username.text = viewModel?.user?.username ?? "username"
        
        setupStackViewTap()
        }

        private func setupStackViewTap() {
            userStack.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapStackView))
            userStack.addGestureRecognizer(tapGesture)
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
