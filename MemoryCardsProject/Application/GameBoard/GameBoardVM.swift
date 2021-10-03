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
    var gameFinished = BehaviorRelay<Bool>(value: false)
    var sizeOne = BehaviorRelay<Int?>(value: nil)
    var sizeTwo = BehaviorRelay<Int?>(value: nil)
    let disposeBag = DisposeBag()
    
    init() {
        bind()
    }
    
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
    
    func isFirstCardSelected() -> Bool {
        return flippedCardIndex == -1
    }
    
    func firstCardSelected(at index: Int, _ card: CardCell) {
        prevCard = card
        flippedCardIndex = index
    }
    
    func secondCardSelected(at index: Int, _ card: CardCell) {
        checkTwoCardsMatched(at: index, at: flippedCardIndex) ? matched(at: index) : notMatched(at: index, card)
        turnToFirstState()
    }
        
    func checkTwoCardsMatched(at index: Int, at otherIndex: Int) -> Bool {
        return cardsArray[flippedCardIndex].imageName == cardsArray[index].imageName
    }
    
    func matched(at index: Int) {
        cardsArray[flippedCardIndex].isMatched = true
        cardsArray[index].isMatched = true
        totalMatched.accept(totalMatched.value + 1)
    }
    
    func notMatched(at index: Int, _ card: CardCell) {
        guard let prevCard = prevCard else { return }
        flipCard(at: index, card)
        flipCard(at: flippedCardIndex, prevCard)
    }
    
    func turnToFirstState() {
        prevCard = nil
        flippedCardIndex = -1
    }
        
    func flipCard(at index: Int, _ card: CardCell) {
        cardsArray[index].isFlipped ? card.flipDown() : card.flipUp()
        cardsArray[index].isFlipped = !cardsArray[index].isFlipped
    }
    
    func finishGame() {
        print("DONE")
    }
}

// MARK: - Bindings
private extension GameBoardVM {
    func bind() {
        
        Observable.combineLatest(totalMatched, sizeOne, sizeTwo)
            .filter { totalMatched, sizeOne, sizeTwo in
                guard let sizeOne = sizeOne, let sizeTwo = sizeTwo else { return false }
                return totalMatched == sizeOne * sizeTwo / 2
            }
            .subscribe(onNext: { [weak self] _ in
                self?.finishGame()
            })
            .disposed(by: disposeBag)
            
        
    }
}
