//
//  MainViewModel.swift
//  omnioTest
//
//  Created by Stephen Parker on 19/12/2020.
//

import Foundation
import Combine

class LandingViewModel {
    //In
//
    @Published var accountEntry = ""
    @Published var emailEntry = ""
    @Published var passwordEntry = ""
    @Published var loginMessage = ""
    
//
    //Out
    var fieldsValidated: AnyPublisher<Bool, Never> {
        return accountValid.combineLatest(emailValid, passwordValid){ [weak self] (accountValid, emailValid, passwordValid) in
            self?.loginMessage = ""
            return accountValid && emailValid && passwordValid
        }.eraseToAnyPublisher()
    }
    
    var errorMessage: AnyPublisher<String, Never> {
        return accountValid.combineLatest(emailValid, passwordValid, loginError) { (account, email, pass, loginError) in
                if !account {
                    return "Account is invalid"
                }
                if !email {
                    return "Email is invalid"
                }
                if !pass {
                    return "Password is invalid"
                }
                if !loginError.isEmpty {
                    return loginError
                }
                return ""
        }.eraseToAnyPublisher()
    }
    
    var accountValid:AnyPublisher<Bool, Never> {
        return $accountEntry
            .map { $0.count == 8 && CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: $0)) }
            .eraseToAnyPublisher()
    }
    
    var emailValid: AnyPublisher<Bool, Never> {
        return $emailEntry
            .map { $0.isEmail }
            .eraseToAnyPublisher()
    }
    
    var passwordValid: AnyPublisher<Bool, Never> {
        return $passwordEntry
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    var loginError: AnyPublisher<String, Never> {
        return $loginMessage
            .eraseToAnyPublisher()
    }
    
    weak var coordinator: MainCoordinator?
    
    
    private var errorClosure: ((ErrorResult?) -> Void)?
    
    func updateAccount(account: String) {
        accountEntry = account
    }
    
    func updateEmail(email: String) {
        emailEntry = email
    }
    
    func updatePass(password: String) {
        passwordEntry = password
    }
    
    func login() {
        //Yes, this is bad
        if accountEntry == "12345678" && emailEntry.lowercased() == "testdev@omnio.com" && passwordEntry == "Test1234_" {
            API.login { [weak self] (result) in
                switch result {
                case .success:
                    self?.coordinator?.startLogin()
                case .failure(let error):
                    self?.errorClosure?(error)
                }
            }
        } else {
            API.loginFail { [weak self] (result) in
                switch result {
                case .success(let loginFail):
                    self?.loginMessage = loginFail.error?.message ?? ""
                case .failure(let error):
                    self?.errorClosure?(error)
                }
            }
        }

        
    }
    
}
