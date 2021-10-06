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
    
    enum ProfileSideMenuState {
        case close, open
    }

    var sideMenuState: ProfileSideMenuState = .close
    var profileMenuVC = ProfileSideMenuVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        categoriesStackView.delegate = self
        view.addSubview(categoriesStackView)
        setupConstraints()
        createProfileNavBarButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileMenuVC.view.frame = CGRect(x: 16, y: view.safeAreaInsets.top, width: view.bounds.width * 2 / 3, height: view.bounds.height / 2)
        profileMenuVC.view.layer.cornerRadius = 16
        profileMenuVC.view.layer.masksToBounds = true
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([categoriesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     categoriesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     categoriesStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    func categoryButtonTapped(category: CategoryEnum) {
        let vc = GameBoardVC()
        vc.viewModel = GameBoardVM(category: category)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createProfileNavBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didTapProfileButton))
        
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func didTapProfileButton() {
        switch sideMenuState {
        case .close:
            showProfileSideMenu()
        case .open:
            hideProfileSideMenu()
        }
    }
    
    private func showProfileSideMenu() {
        add(profileMenuVC)
        sideMenuState = .open
    }
    
    private func hideProfileSideMenu() {
        profileMenuVC.remove()
        sideMenuState = .close
    }
}
