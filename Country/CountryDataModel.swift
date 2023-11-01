//
//  CountryDataModel.swift
//  Country
//
//  Created by C S Pooja on 27/10/23.
//

import Foundation

enum Country {
    case jordan
    case egypt
    case palestine
    case lebanon
    case qatar
    case uae
    case algeria
    
    var text: String {
        switch self {
        case .jordan: return "Jordan"
        case .egypt: return "Egypt"
        case .palestine: return "Palestine"
        case .lebanon: return "Lebanon"
        case .qatar: return "Qatar"
        case .uae: return "UAE"
        case .algeria: return "Algeria"
        }
    }
    var myImage: String {
        switch self {
        case .jordan: return "Jordan"
        case .egypt: return "egypt"
        case .palestine: return "Palestine"
        case .lebanon: return "lebanon"
        case .qatar: return "qatarnew"
        case .uae: return "uaenew"
        case .algeria: return "algerianew"
        }
    }
}
