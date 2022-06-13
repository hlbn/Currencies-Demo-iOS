//
//  ProductListViewModel.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 12/06/2022.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var products: [Products]
    @Published var cartProducts: [Cart]
    
    init(){
        self.products = []
        self.cartProducts = []
    }
    
    func addToCart(product: Products){
        
        var addNewProduct = true
        
        for (index, item) in cartProducts.enumerated() {
            if item.products.id == product.id {
                cartProducts[index].quantity = cartProducts[index].quantity + 1
                addNewProduct = false
            }
    }
    
        if addNewProduct {
            cartProducts.append(Cart(product: product, quantity: 1))
        }
    }
}
