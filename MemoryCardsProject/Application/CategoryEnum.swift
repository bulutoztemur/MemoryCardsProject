//
//  CategoryEnum.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 17.08.2021.
//

import Foundation

enum CategoryEnum: Int {
    case two, three, four, six
    
    var info: (number: Int, text: String) {
        switch self {
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

