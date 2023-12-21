//
//  UserRemoteDataSource.swift
//  Project SALT
//
//  Created by Arya Ilham on 21/12/23.
//

import Foundation
import Alamofire

protocol LoginRemoteDataSource: AnyObject {
    func login(email: String, password: String, completion: @escaping ((Result<LoginResponse, Error>) -> ()))
}

protocol UserInfoRemoteDataSource: AnyObject {
    func getUserList(completion: @escaping ((Result<UserInfoResponses, Error>) -> ()))
}

class UserRemoteDataSource: UserInfoRemoteDataSource {
    func getUserList(completion: @escaping ((Result<UserInfoResponses, Error>) -> ())) {
        let urlString = APIEndpoints.BASE_URL.rawValue + APIEndpoints.USER_INFO_ENDPOINT.rawValue
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        AF.request(url).responseDecodable(of: UserInfoResponses.self) { responses in
            switch responses.result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}

extension UserRemoteDataSource: LoginRemoteDataSource {
    func login(email: String, password: String, completion: @escaping ((Result<LoginResponse, Error>) -> ())) {
        let urlString = APIEndpoints.BASE_URL.rawValue + APIEndpoints.LOGIN_ENDPOINT.rawValue
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let parameters: Parameters = [
            "password": password,
            "email": email,
        ]
        
        AF.request(url, method: .post, parameters: parameters).responseDecodable(of: LoginResponse.self) { response in
            switch response.result {
            case .success(let success):
                completion(.success(success))
                break
            case .failure(let failure):
                completion(.failure(failure))
                break
            }
        }
    }
}
