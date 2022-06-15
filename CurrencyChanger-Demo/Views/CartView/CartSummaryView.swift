//
//  CartSummaryView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 15/06/2022.
//

import SwiftUI

struct CartSummaryView: View {
    @EnvironmentObject var cart: CartViewModel
    @Binding var subtotal: Float
    var body: some View {
        VStack{
            HStack{
                Text("Zhrnutie").bold()
                         Spacer()
                VStack{
                    HStack{
                        Text("Medzisúčet")
                        Spacer()
                        Text(cart.getPrice(value: subtotal))
                    }
                    HStack{
                        Text("Daň")
                        Spacer()
                        Text(cart.getPrice(value: subtotal*0.20))
                    }
                    HStack{
                        Text("Celkom")
                        Spacer()
                        Text(cart.getPrice(value: Float(truncating: NSNumber(value: subtotal + subtotal*0.20))))
                    }
                }.frame(width: 200)
            }.padding()
        }
    }
}

struct CartSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
