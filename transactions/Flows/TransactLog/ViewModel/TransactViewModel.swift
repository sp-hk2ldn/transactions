//
//  TransactViewModel.swift
//  omnioTest
//
//  Created by Stephen Parker on 20/12/2020.
//

import Foundation

class TransactionLogViewModel {
    weak var coordinator: MainCoordinator?
    private var errorClosure: ((ErrorResult?) -> Void)?
    
    func getTransactionLog(_ closure: @escaping (_ response: [Transaction]) -> ()) {
        API.getTransactions { [weak self] (result) in
            switch result {
            case .success(let transactionsData):
                guard let tx = transactionsData.response?.transactions else {
                    fatalError()
                }
                closure(tx)
            case .failure(let error):
                self?.errorClosure?(error)
            }
        }
    }
}
