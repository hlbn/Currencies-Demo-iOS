//
//  CurrencyTestCase.swift
//  CurrencyChangerTests
//
//  Created by Adam Hlubina on 23/06/2022.
//

import Foundation
import XCTest
@testable import CurrencyChanger_Demo

class CurrencyTestCase: XCTestCase {
    
    let currencyAPI = CurrencyAPI()
    
    func testQuotes() {
        
        //Verify if the quotes are empty
        XCTAssertNil(currencyAPI.currency?.quotes)
        
        //Verify LC call and verify if the quotes are well loaded
        let expectation = self.expectation(description: "Download currencies from currencylayer server")
        
        currencyAPI.fetch{ result in
            XCTAssertNotNil(self.currencyAPI.currency?.quotes)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 100) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
        
        //Convert a total to another currency
        guard let quotes =  self.currencyAPI.currency?.quotes else {
            XCTFail("Expected to get the currency quotes")
            return
        }
        guard let rate =  ["USDCAD"] else {
            XCTFail("Expected to get the rate of currency quote USDCAD rate")
            return
        }
        
        XCTAssertEqual(currencyHelper.totalInCurrency(name: "CAD", for: 1), rate, accuracy: 0.1)
        
        //Verify a total in another currency
        let total: Float = 27.99
        let convertedTotal: Float = total * rate
        XCTAssertEqual(currencyHelper.totalInCurrency(name: "CAD", for: total), convertedTotal, accuracy: 0.1)
        
        //Verify total display
        XCTAssertEqual("\(String(format: "%.2f", convertedTotal)) CAD", currencyHelper.display(total: total))
    }
}
