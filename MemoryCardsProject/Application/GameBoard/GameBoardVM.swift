//
//  GameBoardVM.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 20.08.2021.
//

import Foundation

class CardModel {
    var isFlipped: Bool = false
    var imageName: String = ""
    var isMatched: Bool = false
    
    init(image: String) {
        imageName = image
    }
}

class GameBoardVM {
    var cardsArray: [CardModel] = []
    
    func generateCards(size: Int) {
        for card in CardsEnum.allCases where cardsArray.count < size/2 {
            cardsArray.append(CardModel(image: card.rawValue))
        }
        cardsArray.append(contentsOf: cardsArray)
        cardsArray.shuffle()
    }
    
    func cardTapped(card: CardCell, index: Int) {
        cardsArray[index].isFlipped ? card.flipDown(delay: 0) : card.flipUp()
        cardsArray[index].isFlipped = !cardsArray[index].isFlipped
    }
    
    
}
