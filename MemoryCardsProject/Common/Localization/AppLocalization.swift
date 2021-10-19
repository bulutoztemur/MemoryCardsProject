//
//  AppLocalization.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 15.10.2021.
//

import Foundation

public class AppLocalization {
    public static let shared = AppLocalization()
    
    private init() { /* Singleton */ }

    public var language = AppLanguage.english

}
