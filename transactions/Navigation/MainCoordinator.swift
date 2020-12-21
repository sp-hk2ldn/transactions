//
//  MainCoordinator.swift
//  omnioTest
//
//  Created by Stephen Parker on 19/12/2020.
//

import Foundation
import UIKit

final class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = LandingViewController.instantiate(sb: "Landing")
        let viewModel = LandingViewModel()
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
    }
    
    func startLogin() {
        let vc = TransactLogViewController.instantiate(sb: "TransactLog")
        let viewModel = TransactionLogViewModel()
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    
}
