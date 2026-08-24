//
//  Login.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import UIKit

class Login: UIViewController {

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
        if (ViewModel.accounts.contains
            { account in
            account.userName == userNameText.text?.trimmingCharacters(in: .whitespacesAndNewlines)  &&
            account.passward == passwardText.text?.trimmingCharacters(in: .whitespacesAndNewlines)     })
        {
           print("Valid User")
        }else {print("invalid User")}
    }
    
    let ViewModel = AccountViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainStackView.layer.cornerRadius=15
        userNameText.layer.cornerRadius=10
        passwardText.layer.cornerRadius=10
    }




}
