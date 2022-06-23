//
//  CurrencyChanger_DemoApp.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 09/06/2022.
//

import SwiftUI

@main
struct CurrencyChanger_DemoApp: App {
    @ObservedObject var networkManager = NetworkManager()
    var body: some Scene {
        WindowGroup {
            if networkManager.isConnected == false{
                NoConnection()
            }else{
            ProductListView(cart: CartViewModel())
            }
        }
    }
}
