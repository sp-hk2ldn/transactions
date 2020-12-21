//
//  TransActLogVMTests.swift
//  transactionsTests
//
//  Created by Stephen Parker on 21/12/2020.
//

import XCTest
@testable import transactions

class TransactLogVMTests: XCTestCase {
    var transactions: [Transaction]?
    var viewModel: TransactionLogViewModel?
    var dataSource: TransactLogDataSource?
    
    override func setUpWithError() throws {
        dataSource = TransactLogDataSource()
        viewModel = TransactionLogViewModel()
        
        if let url = Bundle.main.url(forResource: "txLog", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let transactions = try decoder.decode(ResponseData.self, from: data)
                self.transactions = transactions.response?.transactions
            } catch {
                print("Error: \(error)")
            }
        }
    }
    func testTxNumber() {
        XCTAssert(transactions?.count == 4)
    }
    
    func testTxDecodedCorrectly() {
        let tx = transactions?[2]
        XCTAssert(tx?.amount == Decimal(0.45))
        XCTAssert(tx?.currency == .GBP)
        XCTAssert(tx?.dr_cr == .debit)
        XCTAssert(tx?.txdate == "2020-10-14 10:10:03".toDate(dateFormat: "yyyy-MM-dd HH:mm:ss"))
    }
}
