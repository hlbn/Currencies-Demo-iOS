//
//  ProductList.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import Foundation
import Combine

class ProductList: ObservableObject {
    @Published var products: [Products] = []
    
    private let productsDecode = """
        [
            {
                "id": "1",
                "name": "Hrášek",
                "price": 0.95,
                "unit": "balenie"
            },
            {
                "id": "2",
                "name": "Vejce",
                "price": 2.10,
                "unit": "12ks"
            },
            {
                "id": "3",
                "name": "Mléko",
                "price": 1.30,
                "unit": "láhev"
            },
            {
                "id": "4",
                "name": "Fazole",
                "price": 0.73,
                "unit": "plechovka"
            }
        ]
        """.data(using: .utf8)!
    
    func all() -> [Products] {
        let decoder = JSONDecoder()
        let products = try! decoder.decode([Products].self, from: productsDecode)
        print(products)
        return products
    }
}
