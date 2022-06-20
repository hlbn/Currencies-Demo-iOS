//
//  CurrencyViewModel.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 16/06/2022.
//

import Foundation
import SwiftUI

class CurrencyViewModel: ObservableObject {
    @ObservedObject var currentCurrency: CurrencyAPI = CurrencyAPI()
    var shownCurrency: String = "USD"
    var rate: Float = 1.0
    var identifier: String = "$"
    
    enum CurrentCurrency {
        case usd, eur, czk, gbp
    }
    
    func selectedCurrency(currency: CurrentCurrency) {
        switch currency{
            
        case .usd:
            shownCurrency = "USD"
            rate = 1.0
            identifier = "$"
        case .eur:
            shownCurrency = "EUR"
            rate = Float(currentCurrency.currency?.quotes.eur ?? 1.0)
                identifier = "€"
        case .czk:
                shownCurrency = "CZK"
                rate = Float(currentCurrency.currency?.quotes.czk ?? 1.0)
                identifier = "CZK"
        case .gbp:
                shownCurrency = "GBP"
                rate = Float(currentCurrency.currency?.quotes.gbp ?? 1.0)
                identifier = "GBP"
        }
    }
}
