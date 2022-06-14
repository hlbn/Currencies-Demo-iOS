//
//  ProductListViewModel.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 12/06/2022.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var products: [Products] = []
    @Published var cartProducts: [Cart] = []
    
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
    
    func calculateTotalPrice()->String{
        var price : Float = 0
        
        cartProducts.forEach{ (item) in
            price += Float(item.quantity) * Float(truncating: NSNumber(value: item.quantity))
        }
        return getPrice(value: price)
    }
    
    func getPrice(value: Float)->String{
        
        let format = NumberFormatter()
        format.numberStyle = .currency
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
}
