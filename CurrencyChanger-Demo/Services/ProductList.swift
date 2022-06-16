//
//  ProductList.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import Foundation

class ProductList: ObservableObject {
    @Published var products: [Category] = []
    
    private let productsDecode = """
        [
            {
                "name": "Strukoviny",
                "products":[{
                   
                   "name": "Hrášok",
                   "price": 0.95,
                   "unit": "balenie",
                   "image": "peas"
                },
                {
                
                   "name": "Fazule",
                   "price": 0.73,
                   "unit": "plechovka",
                   "image": "beans"
               }],
            },
            {
                "name": "Mliečne výrobky a vajce",
                "products":[{
                         
                    "name": "Vajcia",
                    "price": 2.10,
                    "unit": "12ks",
                    "image": "eggs"
                },
                {
                         
                    "name": "Mlieko",
                    "price": 1.30,
                    "unit": "fľaša",
                    "image": "milk"
                }],
            }
        ]
        """.data(using: .utf8)!
    
    
    func all() -> [Category] {
        let decoder = JSONDecoder()
        let products = try! decoder.decode([Category].self, from: productsDecode)
        return products
    }
}
