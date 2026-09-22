//
//  CountryCodeSelection.swift
//  NewsApp
//
//  Created by Vivek on 22/09/26.
//

import Foundation
import SwiftUI

// MARK: - Country Model
struct Country: Identifiable, Hashable {
    let code: String
    
    var id: String { code }
    
    var name: String {
        Locale.current.localizedString(forRegionCode: code) ?? code.uppercased()
    }
    
    var flag: String {
        let base: UInt32 = 127397
        var scalarView = String.UnicodeScalarView()
        for scalar in code.uppercased().unicodeScalars {
            if let unicodeScalar = UnicodeScalar(base + scalar.value) {
                scalarView.append(unicodeScalar)
            }
        }
        return String(scalarView)
    }
}

// MARK: - Country Data Source
enum CountryData {
    static let supportedCodes = [
        "ae", "ar", "at", "au", "be", "bg", "br", "ca", "ch", "cn",
        "co", "cu", "cz", "de", "eg", "fr", "gb", "gr", "hk", "hu",
        "id", "ie", "il", "in", "it", "jp", "kr", "lt", "lv", "ma",
        "mx", "my", "ng", "nl", "no", "nz", "ph", "pl", "pt", "ro",
        "rs", "ru", "sa", "se", "sg", "si", "sk", "th", "tr", "tw",
        "ua", "us", "ve", "za"
    ]
    
    static var allCountries: [Country] {
        supportedCodes
            .map { Country(code: $0) }
            .sorted { $0.name < $1.name }
    }
}

struct CountryItem: Identifiable, Hashable {
    let code: String
    var id: String { code }
    
    var name: String {
        Locale.current.localizedString(forRegionCode: code) ?? code.uppercased()
    }
    
    var flag: String {
        let base: UInt32 = 127397
        var scalarView = String.UnicodeScalarView()
        for scalar in code.uppercased().unicodeScalars {
            if let unicodeScalar = UnicodeScalar(base + scalar.value) {
                scalarView.append(unicodeScalar)
            }
        }
        return String(scalarView)
    }
}
