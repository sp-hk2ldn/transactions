//
//  Transaction.swift
//  omnioTest
//
//  Created by Stephen Parker on 20/12/2020.
//

import Foundation

struct ResponseData: Decodable {
    var success: Bool
    var error: String?
    var response: TransactionResponse?
}

extension ResponseData {
    enum CodingKeys: String, CodingKey {
        case success, error, response
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let error = try container.decodeIfPresent(String.self, forKey: .error)
        let success = try container.decodeIfPresent(Bool.self, forKey: .success) ?? false
        let response = try container.decodeIfPresent(TransactionResponse.self, forKey: .response)
        
        self.success = success
        self.error = error
        self.response = response
    }
}

struct TransactionResponse: Decodable {
    var transactions: [Transaction]
}

struct Transaction: Decodable {
    var txdate: Date
    var dr_cr: TxType
    var amount: Decimal
    var currency: TxCurrency
    
    private var dateFormat: String = "yyyy-MM-dd HH:mm:ss"
}

extension Transaction {
    enum CodingKeys: String, CodingKey {
        case txdate, dr_cr, amount, currency
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dateString = try container.decodeIfPresent(String.self, forKey: .txdate) ?? ""
        let dr_cr = try container.decodeIfPresent(TxType.self, forKey: .dr_cr) ?? .debit
        let amount = try container.decodeIfPresent(Decimal.self, forKey: .amount) ?? 1
        let currency = try container.decodeIfPresent(TxCurrency.self, forKey: .currency) ?? .EUR
        
        self.txdate = dateString.toDate(dateFormat: dateFormat)
        self.dr_cr = dr_cr
        self.amount = amount
        self.currency = currency
    }
        
}


