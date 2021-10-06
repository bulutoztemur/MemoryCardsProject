//
//  CategoriesVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 12.08.2021.
//

import UIKit

class CategoriesVC: BaseVC, CategoryTappedProtocol {
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        revertCustomizedNavBar()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([categoriesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     categoriesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     categoriesStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    func categoryButtonTapped(categoryOne: CategoryEnum, categoryTwo: CategoryEnum) {
        let vc = GameBoardVC(categoryOne.info.number, categoryTwo.info.number)
        navigationController?.pushViewController(vc, animated: true)
    }
}
