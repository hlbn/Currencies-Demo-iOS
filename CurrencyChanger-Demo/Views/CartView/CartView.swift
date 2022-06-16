//
//  CartView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 13/06/2022.
//

import SwiftUI


struct CartView: View {
    @EnvironmentObject var cart: CartViewModel
    @ObservedObject var currency = CurrencyAPI()
    var body: some View {
        ZStack {
            backgroundGradient.opacity(0.3).ignoresSafeArea()
            if cart.cartProducts.count == 0{
                Text("Váš nákupný košík je prázdny")
                    .offset(x: 0, y: -100)
                    .foregroundColor(Color.black).opacity(0.6)
            }else{
                ZStack{
                   List{
                    ForEach($cart.cartProducts) { $cartProduct in
                        CartRowView(cartProduct: $cartProduct)
                            .swipeActions{
                                Button(role: .destructive){
                                    cart.removeProduct(product: cartProduct.products, quantity: cartProduct.quantity)
                                } label: {
                                    Text("Remove")
                                    Image(systemName: "trash")
                            }
                        }
                    }
                }.onAppear(){
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().backgroundColor = .clear
                }.buttonStyle(BorderlessButtonStyle())
                HStack{
                    Text("Medzisúčet").font(.headline)
                    Spacer()
                    Text(cart.getPrice(value: cart.subtotal)).font(.title2)
                }.padding()
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
            }.environmentObject(currency)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
