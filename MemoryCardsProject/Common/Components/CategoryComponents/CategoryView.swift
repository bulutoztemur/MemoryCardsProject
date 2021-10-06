//
//  CategoryView.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 16.08.2021.
//

import UIKit

class CategoryView: UIView {
        
    var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalCentering
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()

    var xImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "x"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var firstNumberImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var secondNumberImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(frame: CGRect, category: CategoryEnum) {
        firstNumberImage.image = UIImage(named: category.images.first)
        secondNumberImage.image = UIImage(named: category.images.second)
        super.init(frame: frame)
        configureView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView() {
        contentStack.addArrangedSubview(firstNumberImage)
        contentStack.addArrangedSubview(xImage)
        contentStack.addArrangedSubview(secondNumberImage)
        addSubview(contentStack)
        setupConstraints()
        setBorder()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstNumberImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4),
            firstNumberImage.widthAnchor.constraint(equalTo: firstNumberImage.heightAnchor),
            xImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/8),
            xImage.widthAnchor.constraint(equalTo: xImage.heightAnchor),
            secondNumberImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4),
            secondNumberImage.widthAnchor.constraint(equalTo: secondNumberImage.heightAnchor),
            
            contentStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            contentStack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            contentStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    private func setBorder() {
        layer.borderWidth = 5
        layer.cornerRadius = 20
        layer.borderColor = UIColor.black.cgColor
    }


}
