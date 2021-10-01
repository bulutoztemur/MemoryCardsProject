//
//  Array+Copying.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 29.09.2021.
//

import Foundation

extension Array where Element: Copying {
    func clone() -> Array {
        var copiedArray = Array<Element>()
        for element in self {
            copiedArray.append(element.copy())
        }
        return copiedArray
    }
}
