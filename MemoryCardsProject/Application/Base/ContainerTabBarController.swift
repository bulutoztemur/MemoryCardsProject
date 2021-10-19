//
//  ContainerTabBarController.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 11.08.2021.
//

import UIKit
import RxTheme
import RxSwift
import RxCocoa
import RxLocalizer

class ContainerTabBarController: UITabBarController {
    
    let disposeBag = DisposeBag()
    
    override var selectedViewController: UIViewController? {
        willSet {
            (selectedViewController as? BaseNavigationController)?.popToRootViewController(animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers(setupViewControllers(), animated: true)
        self.tabBar.theme.tintColor = themeResource { $0.tintColor }
        self.tabBar.theme.barTintColor = themeResource { $0.tabBarBgColor }
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: AppFont.mainFontXsmall as Any], for: .normal)
    }
    
    private func setupViewControllers() -> [UIViewController] {
        let categoryVC = CategoriesVC()
        
        
        Localizer.shared.localized("Play")
            .drive(categoryVC.tabBarItem.rx.title)
            .disposed(by: disposeBag)
        categoryVC.tabBarItem.image = UIImage(systemName: "gamecontroller")
        
        let recordsVC = RecordsVC()
        Localizer.shared.localized("Records")
            .drive(recordsVC.tabBarItem.rx.title)
            .disposed(by: disposeBag)
        recordsVC.tabBarItem.image = UIImage(systemName: "rosette")
        
        let shareVC = ShareVC()
        Localizer.shared.localized("Share")
            .drive(shareVC.tabBarItem.rx.title)
            .disposed(by: disposeBag)
        shareVC.tabBarItem.image = UIImage(systemName: "personalhotspot")
        
        let cardsVC = CustomCardsVC()
        Localizer.shared.localized("Cards")
            .drive(cardsVC.tabBarItem.rx.title)
            .disposed(by: disposeBag)
        cardsVC.tabBarItem.image = UIImage(systemName: "greetingcard")
        
        let vcs = [categoryVC, recordsVC, shareVC, cardsVC]
        return vcs.map {
            BaseNavigationController(rootViewController: $0)
        }
    }
}

