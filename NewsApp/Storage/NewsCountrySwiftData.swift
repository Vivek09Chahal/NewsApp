//
//  NewsCountryData.swift
//  NewsApp
//
//  Created by Vivek on 23/09/26.
//

import SwiftData

@Model
class CountryName {
    var countryName: String
    
    init(countryName: String) {
        self.countryName = countryName
    }
}
