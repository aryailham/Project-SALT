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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var profileView: UIImageView = {
        let imageView = UIImageView()
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
        
        stackView.addArrangedSubview(profileView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
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
