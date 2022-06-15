
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

struct ProductListView: View {
    @ObservedObject var cart: CartViewModel
    @State private var products: [Category] = ProductList().all()
    var body: some View {
        NavigationView{
            List(products, id: \.self){ category in
                Section(header:
                            Text(category.name).foregroundColor(Color.brown).fontWeight(.light)) {
                ForEach(category.products, id: \.self){ products in
                    ProductListRow(cart: cart, products: products)
                    }
                }
                .padding()
            }.buttonStyle(BorderlessButtonStyle())
            .onAppear(){
                UITableView.appearance().backgroundColor = .clear // For tableView
                UITableViewCell.appearance().backgroundColor = .clear
            }
            .background(backgroundGradient.opacity(0.3).ignoresSafeArea())
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
                            CartView()
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
            }
            Spacer()
        }.environmentObject(cart)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(cart: CartViewModel())
    }
}
