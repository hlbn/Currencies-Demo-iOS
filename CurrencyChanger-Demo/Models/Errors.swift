//
//  Errors.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 22/06/2022.
//

import Foundation

enum AppError: Error, LocalizedError {
    case currencyError
    
    var errorDescription: String? {
        switch self {
            
        case .currencyError:
            return NSLocalizedString("Could not change currency, please try to reload your app, if problem remains contact support(Pravdepodobne došiel povolený počet API callov pre free subscription, kontaktujte ma)", comment: "")
        }
    }
}

struct ErrorType: Identifiable {
    let id = UUID()
    let error: AppError
}
