//
//  LoginView.swift
//  Bankey
//
//  Created by Jean Ricardo Cesca on 26/07/22.
//

import Foundation
import UIKit

class LoginView: UIView {

    let stackView = UIStackView()
    let usernameTexfField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        
        usernameTexfField.translatesAutoresizingMaskIntoConstraints = false
        usernameTexfField.placeholder = "Username"
        usernameTexfField.delegate = self
        usernameTexfField.autocapitalizationType = .none
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
    }
    
    func configureConstraints() {
        
        stackView.addArrangedSubview(usernameTexfField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

//MARK: - UITextField Delegates

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTexfField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}
