//
//  String+Utils.swift
//  omnioTest
//
//  Created by Stephen Parker on 20/12/2020.
//

import Foundation

extension String {
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func toDate(dateFormat: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from: self) ?? Date()
    }
    

    
    
}
