//
//  CartView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 13/06/2022.
//

import SwiftUI


struct CartView: View {
    @EnvironmentObject var cart: CartViewModel
    @EnvironmentObject var currency: CurrencyAPI
    @EnvironmentObject var currentCurrency: CurrencyViewModel
    @State var currencyButton = false
    var body: some View {
        ZStack {
            backgroundGradient.opacity(0.3).ignoresSafeArea()
            if cart.cartProducts.count == 0{
                Text("Váš nákupný košík je prázdny")
                    .offset(x: 0, y: -100)
                    .foregroundColor(Color.black).opacity(0.6)
            }else{
                VStack{
                   List{
                    ForEach($cart.cartProducts) { $cartProduct in
                        CartRowView(currency: currency.currency, cartProduct: $cartProduct)
                            .swipeActions{
                                Button(role: .destructive){
                                    cart.removeProduct(product: cartProduct.products, quantity: cartProduct.quantity)
                                } label: {
                                    Text("Remove")
                                    Image(systemName: "trash")
                            }
                        }
                    }
                }
                   .onAppear(){
                       
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().backgroundColor = .clear
                }.buttonStyle(BorderlessButtonStyle())
                    Spacer()
                    VStack{
                    HStack{
                    Text("Medzisúčet").font(.headline)
                    Spacer()
                        Text("\(cart.subtotal * currentCurrency.rate, specifier: "%.2f")\(currentCurrency.identifier)").font(.title2)
                }.padding()
                    VStack(alignment: .center){
                        NavigationLink{
                            CartSummaryView()
                        }label: {
                            ButtonView(image: "creditcard", text: "Pokračovať k objednávke").frame(width: 350, height: 40)
                    }
                  }
                }.background(Color.white).shadow(color: Color("backgroundGreen").opacity(0.3), radius: 30, x: 10, y: 0)
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
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(String("\(currentCurrency.shownCurrency)")){
                        currencyButton = true
                    }
                }
            }
            .confirmationDialog("", isPresented: $currencyButton) {
                Button("USD"){currentCurrency.selectedCurrency(currency: .usd)}
                Button("EUR"){currentCurrency.selectedCurrency(currency: .eur)}
                Button("CZK"){currentCurrency.selectedCurrency(currency: .czk)}
                Button("GBP"){currentCurrency.selectedCurrency(currency: .gbp)}
            } message: {
                Text("Select currency")
            }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
