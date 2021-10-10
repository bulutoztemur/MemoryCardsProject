//
//  CategoryButton.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 16.08.2021.
//

import UIKit

class CategoryButton: UIButton {
    
    let categoryView: CategoryView
    var category: CategoryEnum
    
    init(frame: CGRect, category: CategoryEnum) {
        self.category = category
        categoryView = CategoryView(frame: .zero, category: category)
        super.init(frame: frame)
        configureView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView() {
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryView)
        categoryView.isUserInteractionEnabled = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([            
            categoryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            categoryView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            categoryView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            categoryView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
}
