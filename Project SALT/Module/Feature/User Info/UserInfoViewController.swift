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
    var remoteDataSource: UserInfoRemoteDataSource?
    var userInfoData: [UserInfo]?
    
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
        self.remoteDataSource?.getUserList(completion: { result in
            switch result {
            case .success(let userInfos):
                self.userInfoData = userInfos.userInfo
                DispatchQueue.main.async { [weak self] in
                    self?.userInfoTableView.reloadData()
                }
            case .failure(let failure):
                break
            }
        })
    }
}

extension UserInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.ID, for: indexPath) as? UserInfoTableViewCell, let userInfos = userInfoData else {
            return UITableViewCell()
        }
        
        cell.setupData(user: userInfos[indexPath.row])
        return cell
    }
}
