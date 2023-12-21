//
//  UserInfoViewController.swift
//  Project SALT
//
//  Created by Arya Ilham on 22/12/23.
//

import UIKit

class UserInfoViewController: UIViewController {
    // MARK: UIKit
    private lazy var userInfoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserInfoTableViewCell.self, forCellReuseIdentifier: UserInfoTableViewCell.ID)
        return tableView
    }()
    
    // MARK: Variables
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.getUserList()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(userInfoTableView)
        
        NSLayoutConstraint.activate([
            userInfoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            userInfoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            userInfoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func getUserList() {
        
    }
}

extension UserInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
