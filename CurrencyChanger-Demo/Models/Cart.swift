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
    var subtotal: Float = 0.0
    var isAdded: Bool = false
    
    init(product: Products, quantity: Int) {
        self.id = UUID().uuidString
        self.products = product
        self.quantity = quantity
    }
}

