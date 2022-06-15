//
//  Products.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import Foundation

struct Category: Decodable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var products: [Products]
    
    enum CodingKeys: String, CodingKey {
        case name, products
    }
}

struct Products: Decodable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var price: Float
    var unit: String
    var image: String
    var isAdded: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case name, price, unit, image
    }
}
