//
//  ViewController.swift
//  thePerfectChoice
//
//  Created by Celio Ferreira on 08/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    var homeScreen: HomeScreen?

    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.textFieldDelegate(delegate: self)
        self.homeScreen?.delegate(delegate: self)
        
        
    }
    func habilitarBotaoLogin(){
        let mail: String = homeScreen?.loginTextField.text ?? ""
        let password: String = homeScreen?.passwordTextField.text ?? ""

        if !mail.isEmpty && !password.isEmpty {
            print("Botao habilitado")
            homeScreen?.loginButton.isEnabled = true
            homeScreen?.loginButton.backgroundColor = .purple.withAlphaComponent(1)
            homeScreen?.loginButton.setTitleColor(.white, for: .normal)
        }

    }

}
extension HomeViewController: UITextFieldDelegate {
    private func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)
    }
    private func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        habilitarBotaoLogin()
        return false
    }
}

extension HomeViewController: HomeScreenProtocol {
    
    
    func tappedRecoverPasswordButton() {
        
    }
    
    func tappedLoginButton() {
        let loggedScreenController = LoggedViewController()
        navigationController?.pushViewController(loggedScreenController, animated: true)
    }
    
    func tappedRegisterButton() {
        
    }
}
