//
//  HomeScreen.swift
//  thePerfectChoice
//
//  Created by Celio Ferreira on 08/03/23.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
        func tappedRecoverPasswordButton()
        func tappedLoginButton()
        func tappedRegisterButton()
        
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol){
        self.delegate = delegate
    }
    
    
    //CRIAR A VIEW
    lazy var logoImage: UIImageView = {
    let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.image = UIImage(named: "gasoline")
        im.contentMode = .scaleToFill
        im.alignmentRect(forFrame: .infinite)
        
        
    
    return im
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = .systemYellow
        
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.6)])
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.keyboardType = .emailAddress
        tf.backgroundColor = .darkGray.withAlphaComponent(0.6)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 12
        tf.autocorrectionType = .no
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSAttributedString(string: "Digite sua senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.6)])
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.backgroundColor = .darkGray.withAlphaComponent(0.6)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 12
        tf.autocorrectionType = .no
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.setTitle("Esqueceu a senha?", for: .normal)
        button.addTarget(self, action: #selector(tappedRecoverPasswordButton), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedRecoverPasswordButton(_ sender: UIButton){
        delegate?.tappedRecoverPasswordButton()
    }
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.backgroundColor = .yellow.withAlphaComponent(0.2)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
       button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedLoginButton(_ sender: UIButton){
        delegate?.tappedLoginButton()
    }
    
    lazy var lineview: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    
    return view
    
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        button.backgroundColor = .yellow.withAlphaComponent(0.5)
        button.setTitle("Registrar", for: .normal)
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedRegisterButton(_ sender: UIButton){
        delegate?.tappedRegisterButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCreationView()
        setupBackGround()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func textFieldDelegate(delegate: UITextFieldDelegate){
        self.loginTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    private func setupCreationView(){
        addSubview(logoImage)
        addSubview(titleLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(recoverPasswordButton)
        addSubview(loginButton)
        addSubview(lineview)
        addSubview(registerButton)
    }
    
    private func setupBackGround(){

        backgroundColor = .black
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            // Posiciona a logoImage no centro do eixo x abaixo da Safe Area
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImage.heightAnchor.constraint(equalToConstant: 150),
            logoImage.widthAnchor.constraint(equalToConstant: 150),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // Posiciona o titleLabel abaixo da imagem com quebra de linha ativada
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 30),
            
            self.loginTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            self.loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 10),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.recoverPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 10),
            self.recoverPasswordButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            
            self.loginButton.topAnchor.constraint(equalTo: self.recoverPasswordButton.bottomAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            self.loginButton.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),
            
            self.lineview.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 48),
            self.lineview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            self.lineview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            self.lineview.heightAnchor.constraint(equalToConstant: 0.5),
            
            self.registerButton.topAnchor.constraint(equalTo: self.lineview.bottomAnchor, constant: 30),
            self.registerButton.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            self.registerButton.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),
        ])
    }
        
}
