//
//  CountrySelectionView.swift
//  NewsApp
//
//  Created by Vivek on 22/09/26.
//

// country: Find sources that display news in a specific country. Possible options: ae |  ar | at | au | be | bg | br | ca | ch | cn | co | cu | cz | de | eg | fr | gb | gr | hk | hu | id | ie | il | in | it | jp | kr | lt | lv | ma | mx | my | ng | nl | no | nz | ph | pl | pt | ro | rs | ru | sa | se | sg | si | sk | th | tr | tw | ua | us | ve | za. Default: all countries.

import SwiftUI

// MARK: - Initial Onboarding Selection View
struct CountrySelectionOnboardingView: View {
    @Binding var selectedCountryCode: String
    @Binding var hasCompletedOnboarding: Bool
    
    @State private var searchText = ""
    
    private var filteredCountries: [Country] {
        if searchText.isEmpty {
            return CountryData.allCountries
        } else {
            return CountryData.allCountries.filter { country in
                country.name.localizedCaseInsensitiveContains(searchText) ||
                country.code.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Select your preferred country to get personalized news headlines.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                
                List(filteredCountries) { country in
                    Button {
                        selectedCountryCode = country.code
                        hasCompletedOnboarding = true
                    } label: {
                        HStack(spacing: 12) {
                            Text(country.flag)
                                .font(.title2)
                            
                            Text(country.name)
                                .font(.body)
                                .foregroundStyle(.primary)
                            
                            Spacer()
                            
                            if selectedCountryCode.lowercased() == country.code.lowercased() {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.blue)
                                    .font(.body.bold())
                            }
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Choose Country")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search country")
        }
    }
}

// MARK: - Root App Flow Entry Point
struct RootView: View {
    // Persists the selection across app launches using UserDefaults
    @AppStorage("userCountryCode") private var userCountryCode: String = "us"
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    
    var body: some View {
        if hasCompletedOnboarding {
            // Main App Feed View
            MainPage()
        } else {
            // First Time Opening Screen
            CountrySelectionOnboardingView(
                selectedCountryCode: $userCountryCode,
                hasCompletedOnboarding: $hasCompletedOnboarding
            )
        }
    }
}

#Preview {
    RootView()
}
