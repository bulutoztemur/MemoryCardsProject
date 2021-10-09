//
//  Theme.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 9.10.2021.
//

import RxTheme
import RxSwift

typealias Attributes = [NSAttributedString.Key: Any]

protocol Theme {
    var tabBarBgColor: UIColor { get }
    var navBarStyle: UIBarStyle { get }
    var barTintColor: UIColor { get }
    var navigationBarTitleTextAttributes: Attributes { get }
    var profileViewBgColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

struct LightTheme: Theme {
    let backgroundColor = UIColor.white
    let textColor = UIColor.black
    let tabBarBgColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let navBarStyle: UIBarStyle = .default
    let barTintColor: UIColor = .black
    let navigationBarTitleTextAttributes: Attributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
    let profileViewBgColor: UIColor = UIColor(white: 1, alpha: 0.9)
}

struct DarkTheme: Theme {
    let backgroundColor = UIColor.black
    let textColor = UIColor.white
    let tabBarBgColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let navBarStyle: UIBarStyle = .black
    let barTintColor: UIColor = .systemGreen
    let navigationBarTitleTextAttributes: Attributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
    let profileViewBgColor: UIColor = UIColor(white: 0, alpha: 0.9)
}

enum ThemeType: ThemeProvider {
    case light, dark
    var associatedObject: Theme {
        switch self {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        }
    }
}

let themeService = ThemeType.service(initial: .dark)
func themeResource<T>(_ mapper: @escaping ((Theme) -> T)) -> Observable<T> {
    return themeService.attrStream(mapper)
}

