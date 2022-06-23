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
    @Published var appError: ErrorType? = nil
    @Published var shownCurrency: String = "USD"
    @Published var rate: Float = 1.0
    @Published var identifier: String = "$"
    
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
            if currentCurrency.currency?.quotes.eur != nil{
            shownCurrency = "EUR"
            rate = Float(currentCurrency.currency?.quotes.eur ?? 1.0)
                identifier = "€"
            }else{
                self.appError = ErrorType(error: .currencyError)
            }
        case .czk:
            if currentCurrency.currency?.quotes.czk != nil{
                shownCurrency = "CZK"
                rate = Float(currentCurrency.currency?.quotes.czk ?? 1.0)
                identifier = "Kč"
            }else{
                self.appError = ErrorType(error: .currencyError)
            }
        case .gbp:
            if currentCurrency.currency?.quotes.gbp != nil{
                shownCurrency = "GBP"
                rate = Float(currentCurrency.currency?.quotes.gbp ?? 1.0)
                identifier = "£"
            }else{
                self.appError = ErrorType(error: .currencyError)
            }
        }
    }
}
