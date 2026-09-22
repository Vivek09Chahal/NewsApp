//
//  HomePageHeaderView.swift
//  NewsApp
//
//  Created by Vivek on 22/09/26.
//

import SwiftUI

struct HomePageHeaderView: View {
    @Bindable var homePageViewModel: homePageVM
    
    /// Converts the stored 2-letter country code into a full localized country name
    private var countryName: String {
        let name = Locale.current.localizedString(forRegionCode: homePageViewModel.country) ?? homePageViewModel.country
        return name.uppercased()
    }
    
    /// Generates a flag emoji from the 2-letter ISO country code
    private var countryFlag: String {
        let base: UInt32 = 127397
        var scalarView = String.UnicodeScalarView()
        for scalar in homePageViewModel.country.uppercased().unicodeScalars {
            if let unicodeScalar = UnicodeScalar(base + scalar.value) {
                scalarView.append(unicodeScalar)
            }
        }
        return String(scalarView)
    }
    
    var body: some View {
        Menu {
            Picker("Select Country", selection: $homePageViewModel.country) {
                ForEach(CountryData.allCountries) { country in
                    HStack {
                        Text(country.flag)
                        Text(country.name)
                            .foregroundStyle(.black)
                    }
                    .tag(country.code)
                }
            }
        } label: {
            HStack(spacing: 6) {
                Text(countryFlag)
                    .font(.title3)
                
                Text("\(countryName) NEWS")
                    .fontDesign(.rounded)
                    .font(.headline)
                                
                Image(systemName: "chevron.down")
                    .font(.caption2.bold())
            }
            .contentShape(Rectangle())
            .foregroundStyle(.black)
        }
    }
}
