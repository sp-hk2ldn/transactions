//
//  LoginResponse.swift
//  omnioTest
//
//  Created by Stephen Parker on 21/12/2020.
//

import Foundation

struct LoginResponseData: Decodable {
    var success: Bool
    var error: LoginError?
    var response: LoginResponse
}

struct LoginResponse: Decodable {
    var login: String
}

struct LoginError: Decodable {
    var message: String
    var error_code: Int
}
