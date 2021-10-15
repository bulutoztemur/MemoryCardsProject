//
//  CategoriesStackView.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 16.08.2021.
//

import UIKit

protocol CategoryTappedProtocol {
    func categoryButtonTapped(category: CategoryEnum)
}

class CategoriesStackView: UIStackView {
    
    var delegate: CategoryTappedProtocol?
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
        spacing = 40
        setCategoryButtons()
        addCategoryButtonsToView()
    }
    
    private func setCategoryButtons() {
        categoryButtons.append(CategoryButton(frame: .zero, category: CategoryEnum.twoThree))
        categoryButtons.append(CategoryButton(frame: .zero, category: CategoryEnum.threeFour))
        categoryButtons.append(CategoryButton(frame: .zero, category: CategoryEnum.fourSix))
    }
    
    private func addCategoryButtonsToView() {
        for categoryButton in categoryButtons {
            categoryButton.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
            addArrangedSubview(categoryButton)
        }
    }
    
    @objc private func categoryButtonTapped(sender: CategoryButton) {
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.fromValue = UIColor.gray.cgColor
        colorAnimation.duration = 1
        sender.layer.add(colorAnimation, forKey: "ColorPulse")
        delegate?.categoryButtonTapped(category: sender.category)
    }
}
