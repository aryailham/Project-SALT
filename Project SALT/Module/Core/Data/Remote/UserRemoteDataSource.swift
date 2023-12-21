//
//  UserRemoteDataSource.swift
//  Project SALT
//
//  Created by Arya Ilham on 21/12/23.
//

import Foundation


protocol LoginRemoteDataSource {
    func login(email: String, password: String)
}

class UserRemoteDataSource {
    
}

extension UserRemoteDataSource: LoginRemoteDataSource {
    func login(email: String, password: String) {
        
    }
}
