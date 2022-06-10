//
//  ProductListView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.white, Color.brown],
    startPoint: .topLeading, endPoint: .bottomTrailing)

struct ProductListView: View {
    private let products: [Category] = ProductList().all()
    var body: some View {
        NavigationView{
            List(products, id: \.self){ category in
                Section(header: Text(category.name).foregroundColor(Color.brown)
                                                            .fontWeight(.light)) {
                ForEach(category.products, id: \.self){ products in
                    HStack(alignment: .center, spacing: 0){
                        Image(products.image)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                        Divider()
                VStack(alignment: .leading, spacing: 5){
                    Text(products.name)
                        .font(.title3)
                    HStack(alignment: .center, spacing: 2){
                        Text("\(products.price, specifier: "%.2f")$")
                            .bold()
                            .font(.headline)
                        Text("/\(products.unit)")
                            .font(.subheadline)
                        }
                    } .padding()
                        
                        Spacer()
                        Button{
        
                        }label: {
                            Image(systemName: "cart.badge.plus")
                        }
                        
                        }
                    }
                }
                .padding()
            }
            .onAppear(){
                UITableView.appearance().backgroundColor = .clear // For tableView
                UITableViewCell.appearance().backgroundColor = .clear
            }
            .background(backgroundGradient.opacity(0.3).ignoresSafeArea())
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("Produkty")
                        .fontWeight(.light)
                        .foregroundColor(Color.brown)
                        .font(.title)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                    }label: {
                        Image(systemName: "cart")
                            .foregroundColor(Color.brown)
                    }
                }
            }
            Spacer()
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
