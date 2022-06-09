//
//  Products.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import Foundation

struct Products: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var price: Float
    var unit: String
    
}
