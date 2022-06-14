//
//  ProductListRow.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 14/06/2022.
//

import SwiftUI

struct ProductListRow: View {
    @ObservedObject var cart: CartViewModel
    @State var products: Products
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
                Image(products.image)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                Divider()
        VStack(alignment: .leading, spacing: 5){
            Text(products.name)
                .font(.title3)
        HStack(alignment: .center, spacing: 2){
                Text("\(products.price, specifier: "%.2f")$")
                    .bold()
                    .font(.headline)
                Text("/\(products.unit)")
                    .font(.caption)
                }
            } .padding()
                Spacer()
                Button(action:{
                    cart.addToCart(product: products)
                    }, label: {
                        Image(systemName: "cart.badge.plus")
                            .foregroundColor(Color.black)
                })
        }
    }
}

struct ProductListRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(cart: CartViewModel())
    }
}
