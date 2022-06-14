//
//  Cart.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 12/06/2022.
//

import SwiftUI

struct Cart: Identifiable, Hashable {
    var id: String
    var products: Products
    var quantity: Int
    
    var subTotal : Float { get { return products.price * Float(quantity) } }
    
    init(product: Products, quantity: Int) {
        self.id = UUID().uuidString
        self.products = product
        self.quantity = quantity
    }
}

