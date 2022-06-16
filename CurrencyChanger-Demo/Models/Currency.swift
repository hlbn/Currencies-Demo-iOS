//
//  Currency.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 16/06/2022.
//

import Foundation
import Combine

struct Currency: Decodable{
    var success: Bool
    var timestamp: Int
    var source: String
    var quotes: Quotes
    
}
struct Quotes: Decodable{
    var eur: Double
    var czk: Double
    var gbp: Double
    
    enum CodingKeys: String,CodingKey{
        case eur = "USDEUR"
        case czk = "USDCZK"
        case gbp = "USDGBP"
    }
}

