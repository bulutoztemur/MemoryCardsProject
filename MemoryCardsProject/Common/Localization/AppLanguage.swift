//
//  AppLanguage.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 15.10.2021.
//

import Foundation

public enum AppLanguage: String, CaseIterable {
    case english = "en"
    case turkish = "tr"
    
    static var language: AppLanguage {
        GlobalSettings.language
    }

    public func getLocalize() -> String {
        switch self {
        case .turkish:
            return "tr-TR"
        case .english:
            return "en"
        }
    }

    public func getLocalizeIso639_2() -> String {
        switch self {
        case .turkish:
            return "tr"
        case .english:
            return "en"
        }
    }

    public func getLocale() -> Locale {
        switch self {
        case .turkish:
            return Locale.turkey
        case .english:
            return Locale.english
        }
    }
}
