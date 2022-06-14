//
//  CartRowView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 13/06/2022.
//

import SwiftUI

struct CartRowView: View {
    @Binding var cartProduct: Cart
    var body: some View {
        if cartProduct.id.isEmpty{
            Text("Váš nákupný košík je prázdny")
        }else{
        HStack(alignment: .center, spacing: 0) {
            Image(cartProduct.products.image)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                Divider()
        VStack(alignment: .leading, spacing: 5){
            Text(cartProduct.products.name)
                .font(.title3)
        HStack(alignment: .center, spacing: 2){
            Text("\(cartProduct.products.price, specifier: "%.2f")$")
                    .bold()
                    .font(.headline)
            Text("/\(cartProduct.products.unit)")
                .font(.caption)
                }
            } .padding()
            Spacer()
            Button(action:{
                
                }, label: {
                    Image(systemName: "minus")
                        .foregroundColor(Color.black)
                }).frame(width: 20, height: 20)
            Text("\(cartProduct.quantity)")
                .padding()
            
            Button(action:{
                
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
