//
//  ProductListRow.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 14/06/2022.
//

import SwiftUI

struct ProductListRow: View {
    @ObservedObject var cart: CartViewModel
    @EnvironmentObject var currency: CurrencyAPI
    @State var products: Products
    @Binding var nightMode: Bool
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
                Image(products.image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                Divider()
        VStack(alignment: .leading, spacing: 5){
            Text(products.name)
                .font(.title3)
            HStack(alignment: .center, spacing: 1){
                Text("\(products.price, specifier: "%.2f")$")
                    .bold()
                    .font(.subheadline)
                Text("/\(products.unit)")
                .font(.caption2)
              }
            } .padding()
                Spacer()
                Button(action:{
                    cart.addToCart(product: products)
                    }, label: {
                        Image(systemName: "cart.badge.plus")
                            .foregroundColor(nightMode ? .white : .black)
            })
        }.frame(height: 50)
    }
}

struct ProductListRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
