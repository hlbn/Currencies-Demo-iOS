//
//  CartView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 13/06/2022.
//

import SwiftUI


struct CartView: View {
    @EnvironmentObject var cart: CartViewModel
    var body: some View {
        ZStack {
            backgroundGradient.opacity(0.3).ignoresSafeArea()
            if cart.cartProducts.count == 0{
                Text("Váš nákupný košík je prázdny")
                        .offset(x: 0, y: -100)
                        .foregroundColor(Color.black).opacity(0.6)
            }else{
                List($cart.cartProducts) { $cartProduct in
                    ZStack{
                    CartRowView(cartProduct: $cartProduct)
                }
           }.onAppear(){
               UITableView.appearance().backgroundColor = .clear
               UITableViewCell.appearance().backgroundColor = .clear
                }
              }
            }.navigationViewStyle(StackNavigationViewStyle())
             .navigationBarTitleDisplayMode(.large)
             .toolbar {
                 ToolbarItem(placement: .principal){
                     Text("Košík")
                         .fontWeight(.light)
                         .foregroundColor(Color.brown)
                         .font(.title)
                }
           }
     }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
