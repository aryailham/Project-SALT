//
//  UserInfoTableViewCell.swift
//  Project SALT
//
//  Created by Arya Ilham on 22/12/23.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    static let ID = "UserInfoTableViewCell"
    
    // MARK: - UIKit
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var profileView: UIImageView = {
        let imageView = UIImageView()
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Functions
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.contentView.addSubview(stackView)
        
        let imageContainerView = UIView()
        imageContainerView.addSubview(profileView)
        
        stackView.addArrangedSubview(imageContainerView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            profileView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            profileView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            profileView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 80),
            imageContainerView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            imageContainerView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
    }
    
    func setupData(user: UserInfo) {
        self.nameLabel.text = "\(user.firstName ?? "") \(user.lastName ?? "")"
        self.emailLabel.text = "\(user.email ?? "")"
        if let avatar = user.avatar,  let url = URL(string: avatar) {
            self.profileView.setOnlineImage(url: url)
        }
    }
}
