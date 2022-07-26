//
//  ViewController.swift
//  Bankey
//
//  Created by Jean Ricardo Cesca on 26/07/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTexfField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        configureConstraints()
    }


}

extension LoginViewController {
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.layer.cornerRadius = 8
        loginView.clipsToBounds = true
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 //indica espaço
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        signInButton.backgroundColor = .blue
        signInButton.layer.cornerRadius = 8
        signInButton.clipsToBounds = true
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemPink
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func configureConstraints() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            loginView.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2)
            
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2)
            
        ])
    }
}

extension LoginViewController {
    
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        
        guard let username = username else { return }
        guard let password = password else { return }
        
        if username.isEmpty || password.isEmpty {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = "Preencha os campos acima com seu Username e Password"
            return
        }
        
        if username == "jeancesca" && password == "123456" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = "Verifique seu Username e Password"
        }
    }
}

