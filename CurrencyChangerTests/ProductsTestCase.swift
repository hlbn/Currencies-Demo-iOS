//
//  CurrencyChangerTests.swift
//  CurrencyChangerTests
//
//  Created by Adam Hlubina on 22/06/2022.
//

import XCTest
@testable import CurrencyChanger_Demo

class ProductsTestCase: XCTestCase {
    
    let products = ProductList().all()
    
    func testProductCount() {
        XCTAssertEqual(products.count, 2)
    }
    
    func testProductPrices() {
        XCTAssertEqual(products[0].products[0].price, 0.95, "Balík fazule stoji 0.95$")
        XCTAssertEqual(products[0].products[1].price, 0.73, "Plechovka hrášku stojí 0.73$")
        XCTAssertEqual(products[1].products[0].price, 2.1, "12ks vajec stojí 2.10$")
        XCTAssertEqual(products[1].products[1].price, 1.3, "Fľaša mlieka stojí 1.30$")
    }
}
