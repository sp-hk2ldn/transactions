//
//  TransactLogDataSource.swift
//  omnioTest
//
//  Created by Stephen Parker on 20/12/2020.
//

import UIKit

class TransactLogDataSource: NSObject, UITableViewDataSource {
    
    var transactLog = [Transaction]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactLog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionLogCell") as! TransactLogCell
        let currentTx = transactLog[indexPath.row]
        let txType = currentTx.dr_cr
        cell.transactionTypeLabel.textColor = (txType == .credit ? .green : .red)
        cell.transactionTypeLabel.text = txType.rawValue
        cell.transactionDateTimeLabel.text = currentTx.txdate.toDateString(nil)
        cell.transactionAmountLabel.text =  "\(currentTx.currency.rawValue)\(currentTx.amount)"
        return cell
    }
}
