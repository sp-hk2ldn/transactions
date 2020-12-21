//
//  API.swift
//  omnioTest
//
//  Created by Stephen Parker on 21/12/2020.
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

enum ErrorResult: Error {
    case url(message: String)
    case server(message: String)
    case data(message: String)
}

class API {
    
    static func login(_ closure: @escaping (Result<LoginResponseData, ErrorResult>)->()) {
        if let url = Bundle.main.url(forResource: "successfulLogin", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let loginResponse = try decoder.decode(LoginResponseData.self, from: data)
                closure(.success(loginResponse))
            } catch {
                closure(.failure(.url(message: "Error")))
                print("Error: \(error)")
            }
        }
    }
    
    static func loginFail(_ closure: @escaping (Result<LoginResponseData, ErrorResult>)->()) {
        if let url = Bundle.main.url(forResource: "failedLogin", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let loginResponse = try decoder.decode(LoginResponseData.self, from: data)
                closure(.success(loginResponse))
            } catch {
                closure(.failure(.url(message: "Error")))
                print("Error: \(error)")
            }
        }
    }
    
    static func getTransactions(_ closure: @escaping (Result<ResponseData, ErrorResult>)->()) {
        if let url = Bundle.main.url(forResource: "txLog", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let transactions = try decoder.decode(ResponseData.self, from: data)
                closure(.success(transactions))
            } catch {
                closure(.failure(.url(message: "Error")))
                print("Error: \(error)")
            }
        }
    }
}
