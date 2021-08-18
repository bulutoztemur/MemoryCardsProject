//
//  GameBoardVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 18.08.2021.
//

import UIKit

class GameBoardVC: UIViewController {
    
    var categoryOne: CategoryEnum
    var categoryTwo: CategoryEnum

    init(category1: CategoryEnum, category2: CategoryEnum) {
        categoryOne = category1
        categoryTwo = category2
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
