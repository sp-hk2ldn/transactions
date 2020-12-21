//
//  TyType.swift
//  omnioTest
//
//  Created by Stephen Parker on 20/12/2020.
//

import Foundation

enum TxType: String, Decodable {
    case debit = "DEBIT"
    case credit = "CREDIT"
}
