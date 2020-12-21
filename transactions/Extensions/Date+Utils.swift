//
//  Date+Utils.swift
//  omnioTest
//
//  Created by Stephen Parker on 21/12/2020.
//

import Foundation
extension Date {

    func toDateString(_ dateFormat: String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat ?? "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}

