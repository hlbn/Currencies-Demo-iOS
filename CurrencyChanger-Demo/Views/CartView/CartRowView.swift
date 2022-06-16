//
//  CartRowView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 13/06/2022.
//

import SwiftUI

struct CartRowView: View {
    @EnvironmentObject var cart: CartViewModel
    @Binding var cartProduct: Cart
    var body: some View {
        if cartProduct.id.isEmpty{
            Text("Váš nákupný košík je prázdny")
        }else{
        HStack(alignment: .center, spacing: 0) {
            Image(cartProduct.products.image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                Divider()
        VStack(alignment: .leading, spacing: 5){
            Text(cartProduct.products.name)
                .font(.title3)
        HStack(alignment: .center, spacing: 2){
            Text("\(cart.getPrice(value: cartProduct.products.price))")
                    .bold()
                    .font(.headline)
            Text("/\(cartProduct.products.unit)")
                .font(.caption)
                }
            } .padding()
            Spacer()
            Button(action:{
                if cartProduct.quantity > 1{
                    cart.minusQuantity(product: cartProduct.products)
                }
                }, label: {
                    Image(systemName: "minus")
                        .foregroundColor(Color.black)
                }).frame(width: 20, height: 20)
            Text("\(cartProduct.quantity)")
                .padding()
            
            Button(action:{
                cart.addToCart(product: cartProduct.products)
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color.black)
                }).frame(width: 20, height: 20)
            }
        }
    }
}

struct CartRowView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
