//
//  CategoriesVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 12.08.2021.
//

import UIKit

class CategoriesVC: UIViewController {
    
    let myButton = CategoryButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        view.addSubview(myButton)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate(
        [myButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
        myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        myButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    


}
