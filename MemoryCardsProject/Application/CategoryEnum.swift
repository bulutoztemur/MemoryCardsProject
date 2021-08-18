//
//  CategoryEnum.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 17.08.2021.
//

import Foundation

enum CategoryEnum: Int {
    case zero, two, three, four, six
    
    var info: (number: Int, text: String) {
        switch self {
        case .zero:
            return (0, "zero")
        case .two:
            return (2, "two")
        case .three:
            return (3, "three")
        case .four:
            return (4, "four")
        case .six:
            return (6, "six")
        }
    }
}

