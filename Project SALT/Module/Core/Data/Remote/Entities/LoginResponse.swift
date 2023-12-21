//
//  LoginResponse.swift
//  Project SALT
//
//  Created by Arya Ilham on 21/12/23.
//

import Foundation

//enum APIResult<Success: Decodable> {
//  case success(Success)
//  case failure(APIError)
//}

struct LoginResponse: Codable {
    let token: String
}
