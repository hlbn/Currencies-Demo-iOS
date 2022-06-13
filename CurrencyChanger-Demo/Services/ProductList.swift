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
                   
                   "name": "Hrášek",
                   "price": 0.95,
                   "unit": "balenie",
                   "image": "peas"
                },
                {
                
                "name": "Fazole",
                "price": 0.73,
                "unit": "plechovka",
                "image": "beans"
                }],
        },
                    {
                        "name": "Mléčne výrobky a vejce",
                        "products":[{
                         
                         "name": "Vejce",
                         "price": 2.10,
                         "unit": "12ks",
                         "image": "eggs"
                        },
                        {
                         
                         "name": "Mléko",
                         "price": 1.30,
                         "unit": "láhev",
                         "image": "milk"
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
