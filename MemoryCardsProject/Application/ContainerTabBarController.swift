//
//  ContainerTabBarController.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 11.08.2021.
//

import UIKit

class ContainerTabBarController: UITabBarController {
    
    enum ProfileSideMenuState {
        case close, open
    }
    
    var sideMenuState: ProfileSideMenuState = .close
    var profileMenuVC = ProfileSideMenuVC()
    
    override var selectedViewController: UIViewController? {
        didSet {
            if sideMenuState == .open {
                hideProfileSideMenu()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers(setupViewControllers(), animated: true)
        self.tabBar.tintColor = .systemGreen
        self.tabBar.barTintColor = .black
        createProfileNavBarButton()
        navigationItem.backButtonTitle = ""
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileMenuVC.view.frame = CGRect(x: 16, y: view.safeAreaInsets.top, width: view.bounds.width * 2 / 3, height: view.bounds.height / 2)
        profileMenuVC.view.layer.cornerRadius = 16
        profileMenuVC.view.layer.masksToBounds = true
    }

    private func setupViewControllers() -> [UIViewController] {
        let categoryVC = CategoriesVC()
        categoryVC.title = "Play"
        categoryVC.tabBarItem.image = UIImage(systemName: "gamecontroller")
        
        let recordsVC = RecordsVC()
        recordsVC.title = "Records"
        recordsVC.tabBarItem.image = UIImage(systemName: "rosette")
        
        let shareVC = ShareVC()
        shareVC.title = "Share"
        shareVC.tabBarItem.image = UIImage(systemName: "personalhotspot")

        let cardsVC = CustomCardsVC()
        cardsVC.title = "Cards"
        cardsVC.tabBarItem.image = UIImage(systemName: "greetingcard")

        return [categoryVC, recordsVC, shareVC, cardsVC]
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
        selectedViewController?.add(profileMenuVC)
        sideMenuState = .open
    }
    
    private func hideProfileSideMenu() {
        profileMenuVC.remove()
        sideMenuState = .close
    }
}

