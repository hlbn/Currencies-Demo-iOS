
//
//  ProductListView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.white, Color("backgroundGreen")],
    startPoint: .topLeading, endPoint: .bottomTrailing)
let darkBackgroundGradient = LinearGradient(
    colors: [Color.black, Color("backgroundGreen")],
    startPoint: .topLeading, endPoint: .bottomTrailing)

struct ProductListView: View {
    @ObservedObject var networkManager = NetworkManager()
    @ObservedObject var cart = CartViewModel()
    @ObservedObject var currency = CurrencyAPI()
    @ObservedObject var currentCurrency = CurrencyViewModel()
    @State private var products: [Category] = ProductList().all()
    @State private var nightMode: Bool = false
    var body: some View {
        NavigationView{
            List(products, id: \.self){ category in
                Section(header:
                            Text(category.name).foregroundColor(Color.brown).fontWeight(.light)) {
                ForEach(category.products, id: \.self){ products in
                    ProductListRow(cart: cart, products: products, nightMode: $nightMode)
                    }
                }
                .padding()
            }.buttonStyle(BorderlessButtonStyle())
                .onAppear(){
                UITableView.appearance().backgroundColor = .clear
                UITableViewCell.appearance().backgroundColor = .clear
            }
                .background(nightMode ? darkBackgroundGradient.opacity(0.3).ignoresSafeArea() : backgroundGradient.opacity(0.3).ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("Produkty")
                        .fontWeight(.light)
                        .foregroundColor(Color.brown)
                        .font(.title)
                }
                    ToolbarItem(placement: .navigationBarTrailing){
                        ZStack{
                        NavigationLink{
                            CartView(nightMode: $nightMode)
                        }label: {
                            Image(systemName: "cart")
                                .foregroundColor(Color.brown)
                    }
                            Circle()
                                .fill(Color.brown)
                                .frame(width: 15, height: 15)
                                .offset(x: 12, y: 12)
                            Text("\(self.cart.cartProducts.count)")
                                .font(Font.system(.caption))
                                .offset(x: 12, y: 12)
                                .foregroundColor(Color.white)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        if nightMode == false{
                            nightMode = true
                        }else{
                            nightMode = false
                        }
                    }label: {
                        Text(nightMode ? "Light" : "Dark")
                    }
                }
            }
            Spacer()
        }.environmentObject(cart).environmentObject(currency).environmentObject(currentCurrency).environmentObject(networkManager)
            .environment(\.colorScheme, nightMode ? .dark : .light)
        .navigationBarHidden(true)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
