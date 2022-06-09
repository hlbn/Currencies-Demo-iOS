//
//  ProductListView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import SwiftUI

struct ProductListView: View {
    private let products: [Category] = ProductList().all()
    var body: some View {
        NavigationView{
            List(products, id: \.self){ category in
                Section(header: Text(category.name)) {
                ForEach(category.products, id: \.self){ products in
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
                    }
                }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("Produkty")
                        .font(.title)
                }
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
