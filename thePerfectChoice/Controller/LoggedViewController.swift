//
//  LoggedViewController.swift
//  thePerfectChoice
//
//  Created by Celio Ferreira on 08/03/23.
//

import UIKit

class LoggedViewController: UIViewController {
    
    var loggedScreen: LoggedScreen?
    
    override func loadView() {
        self.loggedScreen = LoggedScreen()
        self.view = self.loggedScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loggedScreen?.textFieldDelegate(delegate: self)
        self.loggedScreen?.delegate(delegate: self)

       
    }
    
    func calcularMelhorCombustivel() {
        guard let alcoolText = loggedScreen?.alcoolTextField.text, let alcoolPrice = Double(alcoolText),
              let gasolinaText = loggedScreen?.gasolinaTextField.text, let gasolinaPrice = Double(gasolinaText)
        else{
            loggedScreen?.resultTextField.text = "Digite valores validos"
            return
        }
        
        let resultado = alcoolPrice / gasolinaPrice
        if resultado < 0.7 {
            loggedScreen?.resultTextField.text = "Melhor usar Álcool"
        }else {
            loggedScreen?.resultTextField.text = "Melhor usar Gasolina"
        }
    }



}
extension LoggedViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        resignFirstResponder()
        return false
    }
}

extension LoggedViewController: ConfirmButtonProtocol{
    func tappedConfirmButton() {
        print(#function)
        calcularMelhorCombustivel()
        
    }
}
