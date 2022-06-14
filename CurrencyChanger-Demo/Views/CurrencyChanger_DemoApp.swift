//
//  CurrencyChanger_DemoApp.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import SwiftUI

@main
struct CurrencyChanger_DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ProductList(cart: CartViewModel())
        }
    }
}
