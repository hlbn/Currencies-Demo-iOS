//
//  CartTestCase.swift
//  CurrencyChanger-DemoTests
//
//  Created by Adam Hlubina on 26/06/2022.
//

import XCTest
@testable import CurrencyChanger_Demo

class CartTests: XCTestCase {
    
    let cart = CartViewModel()
    let products = ProductList().all()
    
    var peas: Products { get { return products[0].products[0] } }
    var beans: Products { get { return products[0].products[1] } }
    var eggs: Products { get { return products[1].products[0] } }
    var milk: Products { get { return products[1].products[1] } }
    
    func testEmptyCart() {
        XCTAssert(cart.subtotal == 0.0, "cost of empty cart is USD$ 0")
        XCTAssertEqual(cart.cartProducts.count, 0, "empty cart")
    }
    
    func testAddToCart() {
        
        //Add Peas and check the price
        cart.addToCart(product: peas)
        XCTAssertEqual(cart.subtotal, peas.price, accuracy: 0.001, "Cart price is the the price of a bag of peas")
        
        //Add a dozen of Eggs and check the price
        cart.addToCart(product: eggs)
        XCTAssertEqual(cart.subtotal, peas.price + eggs.price, accuracy: 0.001, "Cart price is the the price of a bag of one bag of peas and one dozen of eggs")

        //Add More dozens of Eggs and check the price
        cart.addToCart(product: eggs)
        cart.addToCart(product: eggs)
        cart.addToCart(product: eggs)
        XCTAssertEqual(cart.subtotal, peas.price + 4 * eggs.price, accuracy: 0.001, "Cart price is  the price of one bag of peas and four dozen of eggs")

        //Add Some bottles of Milk and check the price
        cart.addToCart(product: milk)
        cart.addToCart(product: milk)
        XCTAssertEqual(cart.subtotal, peas.price + 4 * eggs.price + 2 * milk.price, accuracy: 0.001, "Cart price is the price of one bag of peas, four dozen of eggs and two bottles of milk ")
    }
    
    func testCartQuantities() {
        
        //Add a bag of Peas and add a dozen of eggs and check the quantity
        cart.addToCart(product: peas)
        cart.addToCart(product: eggs)
        XCTAssertEqual(cart.cartProducts.count, 2, "Cart contains 2 products")
        
        //Add a pack of milk and add a can of beans and check the quantity
        cart.addToCart(product: milk)
        cart.addToCart(product: beans)
        XCTAssertEqual(cart.cartProducts.count, 4, "Cart should contains 4 products")
    }
    
}
