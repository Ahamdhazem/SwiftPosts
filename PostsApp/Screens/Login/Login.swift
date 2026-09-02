//
//  Login.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import UIKit

class Login: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainStackView.layer.cornerRadius=15
        userNameText.layer.cornerRadius=10
        passwardText.layer.cornerRadius=10
       //SwapToMainScreen() 
    }

    let ViewModel = AccountViewModel()
    @IBOutlet var mainStackView: UIStackView!
    @IBOutlet var userNameText: UITextField!
    @IBOutlet var passwardText: UITextField!
    @IBAction func showHideButton(_ sender: Any) {

        passwardText.isSecureTextEntry.toggle()
        let imageName = passwardText.isSecureTextEntry ? "eye.slash.fill" : "eye.slash.circle.fill"
            
        (sender as AnyObject).setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        //print(ViewModel.accounts)
        ViewModel.LoadAccounts()
        if (ViewModel.accounts.contains{
            account in            
            account.userName == userNameText.text?.trimmingCharacters(in: .whitespacesAndNewlines)  &&
            account.passward == passwardText.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        }){
            
            SwapToMainScreen()
            
        }
        
        else {
            ShowInvalidAlert()
            print("invalid User")
        }
    }
    
    private func ShowInvalidAlert(){
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
    
    
    private func SwapToMainScreen(){
        let mainvc = MainView()
        let navigation = UINavigationController(rootViewController: mainvc)
        guard let window = self.view.window else { return }
            
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve) {
                window.rootViewController = navigation
            }
    }

    

}
