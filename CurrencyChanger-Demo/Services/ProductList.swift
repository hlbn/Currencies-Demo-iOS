//
//  ProductList.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import Foundation
import Combine

class ProductList: ObservableObject {
    @Published var products: [Category] = []
    
    private let productsDecode = """
        [
            {
                "id": "1",
                "name": "Strukoviny",
                "products":[{
                   "id": "1",
                   "name": "Hrášek",
                   "price": 0.95,
                   "unit": "balenie"
                },
                {
                "id": "2",
                "name": "Fazole",
                "price": 0.73,
                "unit": "plechovka"
                }],
        },
                    {
                        "id": "2",
                        "name": "Mléčne výrobky a vejce",
                        "products":[{
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
                        }],
            }
        ]
        """.data(using: .utf8)!
    
    
    func all() -> [Category] {
        let decoder = JSONDecoder()
        let products = try! decoder.decode([Category].self, from: productsDecode)
        print(products)
        return products
    }
}