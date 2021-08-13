//
//  ContainerTabBarController.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 11.08.2021.
//

import UIKit

class ContainerTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        self.setViewControllers(setupViewControllers(), animated: true)
        self.tabBar.tintColor = .systemGreen
        self.tabBar.barTintColor = .black
        navigationController?.setNavigationBarHidden(false, animated: true)
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
}

