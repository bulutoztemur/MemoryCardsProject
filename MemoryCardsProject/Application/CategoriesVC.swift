//
//  CategoriesVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 12.08.2021.
//

import UIKit

class CategoriesVC: UIViewController, CategoryTappedProtocol {
    
    let categoriesStackView: CategoriesStackView = {
        let csv = CategoriesStackView()
        csv.translatesAutoresizingMaskIntoConstraints = false
        return csv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        categoriesStackView.delegate = self
        view.addSubview(categoriesStackView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate(
        [categoriesStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
         categoriesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
         categoriesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    func categoryButtonTapped(categoryOne: CategoryEnum, categoryTwo: CategoryEnum) {
        let vc = GameBoardVC(categoryOne.info.number, categoryTwo.info.number)
        navigationController?.pushViewController(vc, animated: true)
    }
}
