//
//  ViewController.swift
//  omnioTest
//
//  Created by Stephen Parker on 19/12/2020.
//

import UIKit
import Combine

class LandingViewController: UIViewController, Storyboarded {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var accountNumberTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        view.endEditing(true)
        login()
    }
    
    @IBAction func accountTextFieldDidChange(_ sender: UITextField) {
        viewModel.accountEntry = sender.text ?? ""
    }
    @IBAction func emailTextFieldDidChange(_ sender: UITextView) {
        viewModel.emailEntry = sender.text ?? ""
    }
    @IBAction func passwordTextFieldDidChange(_ sender: UITextField) {
        viewModel.passwordEntry = sender.text ?? ""
    }
    
    var viewModel: LandingViewModel!
    private var loginEnabledSubscriber: AnyCancellable?
    private var errorMessageContentSubscriber: AnyCancellable?
    private var errorMessageShownSubscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
    }
    
    deinit {
        print("LandingViewController deallocated")
    }
    
    func configureBindings() {
        loginEnabledSubscriber = viewModel.fieldsValidated
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: loginButton)
        errorMessageContentSubscriber = viewModel.errorMessage
            .receive(on: DispatchQueue.main)
            .compactMap { $0 }
            .assign(to: \.text, on: errorLabel)
        errorMessageShownSubscriber = viewModel.errorMessage
            .receive(on: DispatchQueue.main)
            .compactMap { $0 == "" }
            .assign(to: \.isHidden, on: errorLabel)
    }
    
    func login() {
        ///Should start login process
        viewModel.login()
    }
}

extension LandingViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case accountNumberTextField:
            textField.resignFirstResponder()
            emailAddressTextField.becomeFirstResponder()
        case emailAddressTextField:
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}

