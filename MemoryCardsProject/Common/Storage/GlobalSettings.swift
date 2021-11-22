//
//  GlobalSettings.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 15.11.2021.
//

import Foundation

enum GlobalSettings {
    @UserDefaultsStorageForEnum(key: "Language", defaultValue: AppLanguage.english)
    static var language: AppLanguage
    @UserDefaultsStorageForEnum(key: "DarkModeActive", defaultValue: ThemeType.dark)
    static var darkModeActive: ThemeType
    @UserDefaultsStorage(key: "FontSize", defaultValue: 0)
    static var fontSize: Float

}
