//
//  newsCategoryVM.swift
//  NewsApp
//
//  Created by Vivek on 12/09/26.
//

import Foundation

enum newsCategories: String, CaseIterable, Identifiable {
    case all, business, entertainment, general, health, science, sports, technology

    var id: Self { self }

    var title: String {
        switch self {
        case .all: "All"
        case .business: "Business"
        case .entertainment: "Entertainment"
        case .general: "General"
        case .health: "Health"
        case .science: "Science"
        case .sports: "Sports"
        case .technology: "Technology"
        }
    }
}
