//
//  API KEY.swift
//  Project SALT
//
//  Created by Arya Ilham on 21/12/23.
//

import Foundation

enum APIEndpoints: String {
    case BASE_URL = "https://reqres.in"
    
    // MARK: - USER API
    case LOGIN_ENDPOINT = "/api/login"
    case USER_INFO_ENDPOINT = "/api/users?page=2"
}
