//
//  GameBoardVM.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 20.08.2021.
//

import Foundation
import RxSwift
import RxCocoa

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
    var totalMatched = BehaviorRelay<Int>(value: 0)
    var mismatched = BehaviorRelay<Int>(value: 0)
    var gameFinished = BehaviorRelay<Bool>(value: false)
    var sizeOne = BehaviorRelay<Int?>(value: nil)
    var sizeTwo = BehaviorRelay<Int?>(value: nil)
    let disposeBag = DisposeBag()
    
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
        guard flippedCardIndex != index else { return }
        
        flipCard(at: index, card)
        isFirstCardSelected() ? firstCardSelected(at: index, card) : secondCardSelected(at: index, card)
    }
    
    private func isFirstCardSelected() -> Bool {
        return flippedCardIndex == -1
    }
    
    private func firstCardSelected(at index: Int, _ card: CardCell) {
        prevCard = card
        flippedCardIndex = index
    }
    
    private func secondCardSelected(at index: Int, _ card: CardCell) {
        checkTwoCardsMatched(at: index, at: flippedCardIndex) ? matched(at: index) : notMatched(at: index, card)
        turnToInitialState()
    }
        
    private func checkTwoCardsMatched(at index: Int, at otherIndex: Int) -> Bool {
        return cardsArray[flippedCardIndex].imageName == cardsArray[index].imageName
    }
    
    private func matched(at index: Int) {
        cardsArray[flippedCardIndex].isMatched = true
        cardsArray[index].isMatched = true
        totalMatched.accept(totalMatched.value + 1)
    }
    
    private func notMatched(at index: Int, _ card: CardCell) {
        guard let prevCard = prevCard else { return }
        flipCard(at: index, card)
        flipCard(at: flippedCardIndex, prevCard)
        mismatched.accept(mismatched.value + 1)
    }
    
    private func turnToInitialState() {
        prevCard = nil
        flippedCardIndex = -1
    }
        
    private func flipCard(at index: Int, _ card: CardCell) {
        cardsArray[index].isFlipped ? card.flipDown() : card.flipUp()
        cardsArray[index].isFlipped = !cardsArray[index].isFlipped
    }    
}
