//
//  CurrencyChanger_DemoTests.swift
//  CurrencyChanger-DemoTests
//
//  Created by Adam Hlubina on 26/06/2022.
//

import XCTest
@testable import CurrencyChanger_Demo

class ProductsTestCase: XCTestCase {
    
    let products = ProductList().all()
    
    func testProductCount() {
        XCTAssertEqual(products.count, 2)
        XCTAssertEqual(products[0].products.count, 2)
        XCTAssertEqual(products[1].products.count, 2)
    }
    
    func testProductPrices() {
        XCTAssertEqual(products[0].products[0].price, 0.95, "A bag of peas costs USD$ 0.95")
        XCTAssertEqual(products[0].products[1].price, 0.73, "A can of beans costs USD$ 0.73")
        XCTAssertEqual(products[1].products[0].price, 2.10, "A dozen of eggs costs USD$ 2.10")
        XCTAssertEqual(products[1].products[1].price, 1.30, "A bottle of milk costs USD$ 1.30")
    }
    
    func testProductNamesCategoryOne() {
        let expectedNames = ["hrášok", "fazule"]
        
        for (index, expName) in expectedNames.enumerated() {
            XCTAssert(products[0].products[index].name.lowercased() == expName, "The product name is: \(expName)")
        }
    }
    
    func testProductNamesCategoryTwo() {
        let expectedNames = ["vajcia", "mlieko"]
        
        for (index, expName) in expectedNames.enumerated() {
            XCTAssert(products[1].products[index].name.lowercased() == expName, "The product name is: \(expName)")
        }
    }
    
    func testProductUnitsCategoryOne() {
        let expectedUnits = ["balenie", "plechovka"]
        
        for (index, expUnit) in expectedUnits.enumerated() {
            XCTAssert(products[0].products[index].unit.lowercased() == expUnit, "The product unit is: \(expUnit)")
        }
    }
    
    func testProductUnitsCategoryTwo() {
        let expectedUnits = ["12ks", "fľaša"]
        
        for (index, expUnit) in expectedUnits.enumerated() {
            XCTAssert(products[1].products[index].unit.lowercased() == expUnit, "The product unit is: \(expUnit)")
        }
    }
}
