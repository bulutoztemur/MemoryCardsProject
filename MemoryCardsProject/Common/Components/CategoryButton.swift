//
//  CategoryButton.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 16.08.2021.
//

import UIKit

class CategoryButton: UIButton {
    
    let categoryView: CategoryView = {
       let cv = CategoryView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 5
        layer.cornerRadius = 20
        layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        
        addSubview(categoryView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryView.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            categoryView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

}
