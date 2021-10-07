//
//  CategoriesVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 12.08.2021.
//

import UIKit

class CategoriesVC: BaseVC, CategoryTappedProtocol {
    
    let dummyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImageView: UIImageView = {
       let imgView = UIImageView(image: UIImage(systemName: "person.crop.circle"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapProfileButton)))
        imgView.tintColor = .black
        imgView.isUserInteractionEnabled = true
        return imgView
    }()
    
    let categoriesStackView: CategoriesStackView = {
        let csv = CategoriesStackView()
        csv.translatesAutoresizingMaskIntoConstraints = false
        return csv
    }()
    
    let profileMenuVC: ProfileSideMenuVC = {
       var profileMenuVC = ProfileSideMenuVC()
        profileMenuVC.view.layer.cornerRadius = 16
        profileMenuVC.view.translatesAutoresizingMaskIntoConstraints = false
        return profileMenuVC
    }()
    
    enum ProfileSideMenuState {
        case close, open
    }

    var sideMenuState: ProfileSideMenuState = .close

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        categoriesStackView.delegate = self
        view.addSubview(categoriesStackView)
        dummyView.addSubview(profileImageView)
        view.addSubview(dummyView)
        setupConstraints()
        createProfileNavBarButton()
        profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapProfileButton)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
        
    private func setupConstraints() {
        
        let verticalConstraintProfileImage = NSLayoutConstraint(item: dummyView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: profileImageView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 2, constant: 0)

        NSLayoutConstraint.activate([categoriesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     categoriesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     categoriesStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     
                                     dummyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     dummyView.bottomAnchor.constraint(equalTo: categoriesStackView.topAnchor),
                                     dummyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     dummyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     
                                     profileImageView.leadingAnchor.constraint(equalTo: dummyView.leadingAnchor, constant: 20),
                                     profileImageView.heightAnchor.constraint(equalToConstant: 32),
                                     profileImageView.widthAnchor.constraint(equalToConstant: 32),
                                     verticalConstraintProfileImage,
        ])
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
        NSLayoutConstraint.activate([
            profileMenuVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2),
            profileMenuVC.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4),
            profileMenuVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileMenuVC.view.topAnchor.constraint(equalTo: dummyView.centerYAnchor),
        ])
        sideMenuState = .open
    }
    
    private func hideProfileSideMenu() {
        profileMenuVC.remove()
        sideMenuState = .close
    }
}
