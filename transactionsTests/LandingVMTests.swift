//
//  LandingVMTests.swift
//  transactionsTests
//
//  Created by Stephen Parker on 21/12/2020.
//

import XCTest
import Combine
@testable import transactions

class LandingVMTests: XCTestCase {
    
    var cancellables: Set<AnyCancellable>!
    var viewModel: LandingViewModel!
    var vc = LandingViewController()
    
    override func setUp() {
        self.viewModel = LandingViewModel()
        self.cancellables = []
    }
    
    func testLandingViewModel() {
        let expectedValues = [false, false, false, true]
        viewModel.accountEntry = "1234"
        viewModel.accountEntry = "12345678"
        viewModel.emailEntry = "testdev@omnio.com"
//        viewModel.passwordEntry = "1234"
        
        viewModel.fieldsValidated.sink(receiveValue: { value in
            print(value)
            guard let expectedValue = expectedValues.first else { XCTFail(); return }
            guard expectedValue == value else { XCTFail("Expected \(value) to match \(expectedValue)"); return }
        }).store(in: &cancellables)
    }
    
    
}
