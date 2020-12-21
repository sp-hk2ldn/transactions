//
//  Coordinator.swift
//  omnioTest
//
//  Created by Stephen Parker on 19/12/2020.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
