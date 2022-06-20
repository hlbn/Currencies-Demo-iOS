//
//  ProductListViewModel.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 12/06/2022.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var products: [Products] = []
    @Published var cartProducts: [Cart] = []
    var subtotal: Float = 0.0
    
    func addToCart(product: Products){
        var addNewProduct = true
        let price = Float(product.price)
        subtotal = subtotal + price
        
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
    
    func removeProduct(product: Products,quantity: Int) {
        var price : Float = 0
        price = product.price * Float(quantity)
        subtotal = subtotal - price
        guard let index = cartProducts.firstIndex(where: { $0.products == product }) else { return}
        cartProducts.remove(at: index)
    }
    
    func getPrice(value: Float)->String{
        
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.locale = Locale(identifier: "us_US")
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
    
    func minusQuantity(product: Products){
        let price = Float(product.price)
        subtotal = subtotal - price
        
        for (index, item) in cartProducts.enumerated() {
            if item.products.id == product.id {
                cartProducts[index].quantity = cartProducts[index].quantity - 1
            }
        }
    }
    func plusQuantity(product: Products){
        let price = Float(product.price)
        subtotal = subtotal + price
        
        for (index, item) in cartProducts.enumerated() {
            if item.products.id == product.id {
                cartProducts[index].quantity = cartProducts[index].quantity + 1
            }
        }
    }

}
