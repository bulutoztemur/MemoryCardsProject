//
//  CategoryEnum.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 17.08.2021.
//

import Foundation

enum CategoryEnum: Int {
    case twoThree, threeFour, fourSix
    
    var dimension: (first: Int, second: Int) {
        switch self {
        case .twoThree:
            return (2, 3)
        case .threeFour:
            return (3, 4)
        case .fourSix:
            return (4, 6)
        }
    }
    
    var images: (first: String, second: String) {
        switch self {
        case .twoThree:
            return ("two", "three")
        case .threeFour:
            return ("three", "four")
        case .fourSix:
            return ("four", "six")
        }
    }
}

