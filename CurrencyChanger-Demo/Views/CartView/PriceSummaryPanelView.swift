//
//  CartSummaryView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 15/06/2022.
//

import SwiftUI

struct PriceSummaryPanelView: View {
    @EnvironmentObject var currentCurrency: CurrencyViewModel
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
                        Text("\(subtotal, specifier: "%.2f")\(currentCurrency.identifier)").fontWeight(.semibold)
                    }
                    HStack{
                        Text("Daň")
                        Spacer()
                        Text("\(subtotal * 0.20, specifier: "%.2f")\(currentCurrency.identifier)").fontWeight(.semibold)
                    }
                    HStack{
                        Text("Celkom")
                        Spacer()
                        Text("\(subtotal + subtotal * 0.20, specifier: "%.2f")\(currentCurrency.identifier)").fontWeight(.semibold)
                    }
                }.frame(width: 200)
            }.padding()
            HStack(){
                NavigationLink{
                
                }label: {
                    ButtonView(image: "creditcard", text: "Pokračovať na dodacie údaje")
                }.padding()
            }
        }
    }
}

struct PriceSummaryPanelView_Previews: PreviewProvider {
    static var previews: some View {
        CartSummaryView()
    }
}
