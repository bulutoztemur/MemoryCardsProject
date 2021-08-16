//
//  CategoriesVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 12.08.2021.
//

import UIKit

class CategoriesVC: UIViewController {
    
    let categoryView: CategoryView = {
       let cv = CategoryView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let myButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 5
        button.layer.cornerRadius = 20
        button.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        myButton.addSubview(categoryView)
        view.addSubview(myButton)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate(
        [myButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
        myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        myButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        
        categoryView.centerXAnchor.constraint(equalTo: myButton.centerXAnchor),
        categoryView.topAnchor.constraint(equalTo: myButton.topAnchor, constant: 10),
        categoryView.bottomAnchor.constraint(equalTo: myButton.bottomAnchor, constant: -10)
        ])
    }
    


}
