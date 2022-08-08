//
//  PasswordTextField.swift
//  Password
//
//  Created by Jean Ricardo Cesca on 05/08/22.
//

import Foundation
import UIKit

class PasswordTextField: UIView, UITextFieldDelegate {
    
    private let lockImageView = UIImageView()
    private let textField = UITextField()
    private let placeHolderText: String
    private let eyeButton = UIButton(type: .custom)
    private let dividerView = UIView()
    private let errorLabel = UILabel()
    
    
    init(placeHolderText: String) {
        self.placeHolderText = placeHolderText //as propriedades precisam ser setadas antes do SUPER.INIT SEMPRE
        
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PasswordTextField {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemOrange
        
        lockImageView.image = UIImage(systemName: "lock.fill")
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = false
        textField.placeholder = placeHolderText
        textField.delegate = self
        textField.keyboardType = .asciiCapable //prevenir uso de Emojis
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]) //mudar a cor do Placeholder
        
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .separator
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .systemRed
        errorLabel.font = .preferredFont(forTextStyle: .footnote)
        errorLabel.text = "Your password must meet the requirements below."
        errorLabel.numberOfLines = 0
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.isHidden = false
    }
    
    func layout() {
        addSubview(lockImageView)
        addSubview(textField)
        addSubview(eyeButton)
        addSubview(dividerView)
        addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lockImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1),
            textField.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            eyeButton.topAnchor.constraint(equalTo: topAnchor),
            trailingAnchor.constraint(equalTo: eyeButton.trailingAnchor),
            eyeButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: lockImageView.leadingAnchor),
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 0.75),
            dividerView.trailingAnchor.constraint(equalTo: eyeButton.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 1),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

extension PasswordTextField {
    @objc func togglePasswordView(_ sender: Any) {
        textField.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}

extension PasswordTextField: UITextViewDelegate {
    
    
}
