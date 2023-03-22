//
//  LoggedScreen.swift
//  thePerfectChoice
//
//  Created by Celio Ferreira on 08/03/23.
//

import UIKit

protocol ConfirmButtonProtocol: AnyObject {
    func tappedConfirmButton()
}

class LoggedScreen: UIView {
    
    weak var delegate: (ConfirmButtonProtocol)?
    
    public func delegate(delegate: ConfirmButtonProtocol){
        self.delegate = delegate
    }
    
    //CRIAR A VIEW
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Combustivel"
        label.font = UIFont.systemFont(ofSize: 36)
        label.textColor = .white
        
        return label
    }()
    
    lazy var titleLabelGasolina: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gasolina"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        
        return label
    }()
    
    lazy var titleLabelAlcool: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Alcool"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        
        return label
    }()
    
    lazy var alcoolTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSAttributedString(string: "  preço", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)])
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.keyboardType = .numbersAndPunctuation
        tf.textColor = .white
        tf.backgroundColor = .darkGray.withAlphaComponent(0.6)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 12
        tf.autocorrectionType = .no
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var gasolinaTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSAttributedString(string: "  preço", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)])
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = .white
        tf.keyboardType = .numbersAndPunctuation
        tf.backgroundColor = .darkGray.withAlphaComponent(0.6)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 12
        tf.autocorrectionType = .no
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var confirmButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Confirmar Preço", for: .normal)
            button.backgroundColor = .blue
            button.layer.cornerRadius = 12
            button.addTarget(self, action: #selector(tappedConfirmButton), for: .touchUpInside)
            return button
        }()
    
    @objc func tappedConfirmButton(_ sender: UIButton) {
        delegate?.tappedConfirmButton()
    }
    

        
    lazy var resultTextField: UILabel = {
        let tf = UILabel()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = .white
        tf.textAlignment = .center
        tf.backgroundColor = .darkGray.withAlphaComponent(0.6)
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.text = "Resultado Melhor Alcool ou gasolina"
        tf.heightAnchor.constraint(greaterThanOrEqualToConstant: 300).isActive = true // ajuste a altura conforme necessário
        tf.numberOfLines = 5
        return tf
    }()

        

    func textFieldDelegate(delegate: UITextFieldDelegate){
        self.gasolinaTextField.delegate = delegate
        self.alcoolTextField.delegate = delegate
//        self.resultTextField.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackGround()
        setupCreationView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupCreationView(){
        addSubview(titleLabel)
        addSubview(titleLabelAlcool)
        addSubview(titleLabelGasolina)
        addSubview(alcoolTextField)
        addSubview(gasolinaTextField)
        addSubview(confirmButton)
        addSubview(resultTextField)
    }
    
    private func setupBackGround(){
        backgroundColor = .black
    }
    
    private func configConstraints(){
       
            
            NSLayoutConstraint.activate([
                        
                        self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
                        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                        
                        self.titleLabelAlcool.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
                        self.titleLabelAlcool.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
                        
                        self.titleLabelGasolina.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
                        self.titleLabelGasolina.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
                        
                        self.alcoolTextField.topAnchor.constraint(equalTo: self.titleLabelAlcool.bottomAnchor, constant: 16),
                        self.alcoolTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
                        
                        self.gasolinaTextField.topAnchor.constraint(equalTo: self.titleLabelGasolina.bottomAnchor, constant: 16),
                        self.gasolinaTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
                        
                        self.confirmButton.topAnchor.constraint(equalTo: self.gasolinaTextField.bottomAnchor, constant: 50),
                        self.confirmButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                        self.confirmButton.widthAnchor.constraint(equalToConstant: 200),
                        self.confirmButton.heightAnchor.constraint(equalToConstant: 50),
                        
                        self.resultTextField.topAnchor.constraint(equalTo: self.confirmButton.bottomAnchor, constant: 50),
                        self.resultTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
                        self.resultTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
                        
                    ])

    }
    
}
