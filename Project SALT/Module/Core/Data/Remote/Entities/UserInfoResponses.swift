//
//  UserInfoResponses.swift
//  Project SALT
//
//  Created by Arya Ilham on 22/12/23.
//

import Foundation

struct UserInfoResponses: Codable {
    let userInfo: [UserInfo]
    
    private enum CodingKeys: String, CodingKey {
        case userInfo = "data"
    }
}

struct UserInfo: Codable {
    let id: Int
    let firstName: String?
    let lastName: String?
    let avatar: String?
    let email: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
        case email
    }
}
