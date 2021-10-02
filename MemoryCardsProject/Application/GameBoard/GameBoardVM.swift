//
//  GameBoardVM.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 20.08.2021.
//

import Foundation
import RxSwift

class CardModel: Copying {
    var isFlipped: Bool = false
    var imageName: String = ""
    var isMatched: Bool = false
    
    init(image: String) {
        imageName = image
    }
    
    required init(original: CardModel) {
        imageName = original.imageName
        isFlipped = original.isFlipped
        isMatched = original.isMatched
    }
}

class GameBoardVM {
    var flippedCardIndex = -1
    var cardsArray: [CardModel] = []
    weak var prevCard: CardCell? = nil
    
    func generateCards(size: Int) {
        for card in CardsEnum.allCases where cardsArray.count < size/2 {
            cardsArray.append(CardModel(image: card.rawValue))
        }
        cardsArray.append(contentsOf: cardsArray.clone())
        cardsArray.shuffle()
    }
    
    func cardTapped(card: CardCell, index: Int) {
        guard !CardCell.cardAnimationInProcess else { return }
        guard !cardsArray[index].isMatched else { return }
        guard flippedCardIndex != index else {
            cardsArray[index].isFlipped ? card.flipDown(delay: 0) : card.flipUp()
            cardsArray[index].isFlipped = !cardsArray[index].isFlipped
            flippedCardIndex = -1
            return
        }
        
        cardsArray[index].isFlipped ? card.flipDown(delay: 0) : card.flipUp()
        cardsArray[index].isFlipped = !cardsArray[index].isFlipped

        if flippedCardIndex == -1 {
            prevCard = card
            flippedCardIndex = index
        } else {
            if cardsArray[flippedCardIndex].imageName == cardsArray[index].imageName {
                cardsArray[flippedCardIndex].isMatched = true
                cardsArray[index].isMatched = true
            } else {
                cardsArray[index].isFlipped ? card.flipDown() : card.flipUp()
                cardsArray[index].isFlipped = !cardsArray[index].isFlipped
                
                cardsArray[flippedCardIndex].isFlipped ? prevCard?.flipDown() : card.flipUp()
                cardsArray[flippedCardIndex].isFlipped = !cardsArray[flippedCardIndex].isFlipped
            }
            flippedCardIndex = -1
        }
    }
    
    
}

