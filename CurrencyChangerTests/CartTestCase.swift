//
//  CartTestCase.swift
//  CurrencyChangerTests
//
//  Created by Adam Hlubina on 22/06/2022.
//

import Foundation
import XCTest
@testable import CurrencyChanger_Demo

class CartTests: XCTestCase {
    
    let cart = CartViewModel()
    let products = [Products]
    
    var peas: Products { get { return products[0] } }
    var eggs: Products { get { return products[1] } }
    var milk: Products { get { return products[2] } }
    var beans: Products { get { return products[3] } }
    
    func testEmptyCart() {
        XCTAssert(cart.total == 0, "cost of empty cart is USD$ 0")
        XCTAssertEqual(cart.totalQuantity, 0, "empty cart")
    }
    
    func testAddToCart() {
        
        //Add Peas and check the price
        cart.add(product: peas)
        XCTAssertEqual(cart.total, peas.price, accuracy: 0.001, "Cart price is the the price of a bag of peas")
        
        //Add a dozen of Eggs and check the price
        cart.add(product: eggs)
        XCTAssertEqual(cart.total, peas.price + eggs.price, accuracy: 0.001, "Cart price is the the price of a bag of one bag of peas and one dozen of eggs")

        //Add More dozens of Eggs and check the price
        cart.add(product: eggs)
        cart.add(product: eggs)
        cart.add(product: eggs)
        XCTAssertEqual(cart.total, peas.price + 4 * eggs.price, accuracy: 0.001, "Cart price is  the price of one bag of peas and four dozen of eggs")

        //Add Some bottles of Milk and check the price
        cart.add(product: milk)
        cart.add(product: milk)
        XCTAssertEqual(cart.total, peas.price + 4 * eggs.price + 2 * milk.price, accuracy: 0.001, "Cart price is the price of one bag of peas, four dozen of eggs and two bottles of milk ")
    }
    
    func testCartQuantities() {
        
        //Add a bag of Peas and add a dozen of eggs and check the quantity
        cart.add(product: peas)
        cart.add(product: eggs)
        XCTAssertEqual(cart.totalQuantity, 2, "Cart contains 2 products")
        
        //Add a pack of milk and add a can of beans and check the quantity
        cart.add(product: milk)
        cart.add(product: beans)
        XCTAssertEqual(cart.totalQuantity, 4, "Cart should contains 4 products")
    }
    
}
