//
//  CategoryButton.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 16.08.2021.
//

import UIKit

class CategoryButton: UIButton {
    
    let categoryView: CategoryView
    var category1: CategoryEnum
    var category2: CategoryEnum
    
    init(frame: CGRect, categoryOne: CategoryEnum, categoryTwo: CategoryEnum) {
        category1 = categoryOne
        category2 = categoryTwo
        categoryView = CategoryView(frame: .zero, categoryOne: categoryOne, categoryTwo: categoryTwo)
        super.init(frame: frame)
        configureView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView() {
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        setBorder()
        addSubview(categoryView)
        categoryView.isUserInteractionEnabled = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryView.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            categoryView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    private func setBorder() {
        layer.borderWidth = 5
        layer.cornerRadius = 20
        layer.borderColor = UIColor.black.cgColor

    }

}
