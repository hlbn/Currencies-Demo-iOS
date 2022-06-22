//
//  CartRowView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 13/06/2022.
//

import SwiftUI

struct CartRowView: View {
    @EnvironmentObject var currentCurrency: CurrencyViewModel
    @EnvironmentObject var cart: CartViewModel
    @State var currency: Currency?
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
            HStack(alignment: .center, spacing: 1){
                Text("\(cartProduct.products.price * currentCurrency.rate, specifier: "%.2f")\(currentCurrency.identifier)")
                    .bold()
                    .font(.subheadline)
                Text("/\(cartProduct.products.unit)")
                .font(.caption2)
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
                .frame(width: 30, height: 30)
                .border(.black, width: 1.5)
                .padding()
            
            Button(action:{
                cart.plusQuantity(product: cartProduct.products)
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
