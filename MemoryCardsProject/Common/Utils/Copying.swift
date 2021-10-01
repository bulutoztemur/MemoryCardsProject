//
//  Copying.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 29.09.2021.
//

import Foundation

protocol Copying {
    init(original: Self)
}

extension Copying {
    func copy() -> Self {
        return Self.init(original: self)
    }
}


