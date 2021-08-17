//
//  CategoriesStackView.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 16.08.2021.
//

import UIKit

class CategoriesStackView: UIStackView {
    
    var categoryButtons: [CategoryButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        axis = .vertical
        setCategoryButtons()
        addCategoryButtonsToView()
    }
    
    private func setCategoryButtons() {
        categoryButtons.append(CategoryButton())
    }
    
    private func addCategoryButtonsToView() {
        for categoryButton in categoryButtons {
            addArrangedSubview(categoryButton)
        }
    }
}
