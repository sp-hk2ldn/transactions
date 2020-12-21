//
//  TransactLogViewController.swift
//  omnioTest
//
//  Created by Stephen Parker on 20/12/2020.
//

import Foundation
import UIKit

class TransactLogViewController: UIViewController, UITableViewDelegate, Storyboarded {
    @IBOutlet weak var tableView: UITableView!
    @IBAction func logOutButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    var viewModel: TransactionLogViewModel?
    var tableViewDataSource = TransactLogDataSource()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = tableViewDataSource
        viewModel?.getTransactionLog { [weak self] transactions in
            self?.tableViewDataSource.transactLog = transactions.sorted(by: { $0.txdate.compare($1.txdate) == .orderedAscending })
            self?.tableView.reloadData()
        }
    }
    
    deinit {
        print("TransLog Deallocated")
    }
}


