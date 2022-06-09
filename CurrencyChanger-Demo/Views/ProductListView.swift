//
//  ProductListView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import SwiftUI

struct ProductListView: View {
    private let products: [Products] = ProductList().all()
    var body: some View {
        NavigationView{
            List(products){ products in
                
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
