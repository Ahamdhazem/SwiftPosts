//
//  Login.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import UIKit

class Login: UIViewController {
    let viewModel = loginViewModel()
    @IBOutlet var mainStackView: UIStackView!
    @IBOutlet var userNameText: UITextField!
    @IBOutlet var passwardText: UITextField!
    @IBAction func showHideButton(_ sender: Any) {

        passwardText.isSecureTextEntry.toggle()
        let imageName = passwardText.isSecureTextEntry ? "eye.slash.circle" : "eye.circle"
        (sender as AnyObject).setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        //print(ViewModel.accounts)
        viewModel.loadAccounts()
        let username =  userNameText.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let passward = passwardText.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if(viewModel.login(username!,passward!)){
            swapToMainScreen()
        }
        
        else {
            showInvalidAlert()
            print("invalid User")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        mainStackView.layer.cornerRadius=15
        userNameText.layer.cornerRadius=10
        passwardText.layer.cornerRadius=10
       //SwapToMainScreen()
        
        
    }

    private func showInvalidAlert(){
        let alert = UIAlertController(
            title: "Error",
            message: "Invalid UserName or Passward",
            preferredStyle: .alert
        )

        let Close = UIAlertAction(
            title: "Close",
            style: .cancel
        )

        alert.addAction(Close)

        present(alert, animated: true)
    }
    
    
    private func swapToMainScreen(){
        let mainvc = MainView()
        let navigation = UINavigationController(rootViewController: mainvc)
        guard let window = self.view.window else { return }
            
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve) {
                window.rootViewController = navigation
            }
    }

    

}
