//
//  CartSummeryView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 20/06/2022.
//

import SwiftUI

struct CartSummaryView: View {
    @EnvironmentObject var networkManager: NetworkManager
    @EnvironmentObject var cart: CartViewModel
    @EnvironmentObject var currentCurrency: CurrencyViewModel
    @State var currencyButton = false
    @Binding var nightMode: Bool
    var body: some View {
                VStack{
                   List{
                    ForEach($cart.cartProducts) { $cartProduct in
                        CartSummaryRowView(cartProduct: $cartProduct)
                    }
                }
                   .onAppear(){
                    currencyButton = false
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().backgroundColor = .clear
                }.buttonStyle(BorderlessButtonStyle())
                        .background(nightMode ? darkBackgroundGradient.opacity(0.3).ignoresSafeArea() : backgroundGradient.opacity(0.3).ignoresSafeArea())
                    Spacer()
                        PriceSummaryPanelView(subtotal: $cart.subtotal)
                        .background(nightMode ? Color.black : Color.white).shadow(color: Color("backgroundGreen").opacity(0.3), radius: 30, x: 10, y: 0)
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitleDisplayMode(.large)
            .alert(item: $currentCurrency.appError) { appError in
                Alert(title: Text("We've got a problem"), message: Text(appError.error.localizedDescription))
            }
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

struct CartSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        CartSummaryView(nightMode: .constant(true))
    }
}
