//
//  CartSummaryRowView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 20/06/2022.
//

import SwiftUI

struct CartSummaryRowView: View {
    @EnvironmentObject var currentCurrency: CurrencyViewModel
    @Binding var cartProduct: Cart
    var body: some View {
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
            Text("\(cartProduct.quantity) /ks")
                .padding()
        }
    }
}

struct CartSummaryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CartSummaryView(nightMode: .constant(true))
    }
}
