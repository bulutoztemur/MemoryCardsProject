//
//  CategoryView.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 16.08.2021.
//

import UIKit

class CategoryView: UIStackView {

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
    
    init(frame: CGRect, categoryOne: CategoryEnum, categoryTwo: CategoryEnum) {
        firstNumberImage.image = UIImage(named: categoryOne.info.text)
        secondNumberImage.image = UIImage(named: categoryTwo.info.text)
        super.init(frame: frame)
        configureView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView() {
        distribution = .equalCentering
        alignment = .center
        spacing = 20
        addArrangedSubview(firstNumberImage)
        addArrangedSubview(xImage)
        addArrangedSubview(secondNumberImage)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstNumberImage.widthAnchor.constraint(equalToConstant: 80),
            firstNumberImage.widthAnchor.constraint(equalTo: firstNumberImage.heightAnchor),
            xImage.widthAnchor.constraint(equalToConstant: 40),
            xImage.widthAnchor.constraint(equalTo: xImage.heightAnchor),
            secondNumberImage.widthAnchor.constraint(equalToConstant: 80),
            secondNumberImage.widthAnchor.constraint(equalTo: secondNumberImage.heightAnchor)
        ])
    }

}
