//
//  ViewController.swift
//  Project SALT
//
//  Created by Arya Ilham on 21/12/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI Components
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel =  {
        let label = UILabel()
        label.text = "Login"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter email"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Variables
    var dataSource: LoginRemoteDataSource?
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(submitButton)
        
        stackView.spacing = 8
        
    }
    
    @objc func submitTapped(_ sender: UIButton!) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        dataSource?.login(email: email, password: "\(password)", completion: { results in
            switch results {
            case .success(let _):
                self.goToUserInfoPage()
                break
            case .failure(let failure):
                break
            }
        })
    }
    
    private func goToUserInfoPage() {
        let userInfoController = UserInfoViewController()
        self.navigationController?.pushViewController(userInfoController, animated: true)
    }
}

