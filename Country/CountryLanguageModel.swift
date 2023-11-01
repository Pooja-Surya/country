//
//  CountryLanguageModel.swift
//  Country
//
//  Created by C S Pooja on 30/10/23.
//

import Foundation

enum CountryLanguageModel {
    case english
    case arabic
    
    var text: String {
        switch self {
        case .english: return "English"
        case .arabic: return "Arabic"
        
        }
    }
}
