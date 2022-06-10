//
//  Products.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import Foundation

struct Category: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var products: [Products]
}

struct Products: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var price: Double
    var unit: String
    var image: String
}
