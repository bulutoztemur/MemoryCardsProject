//
//  BaseNavigationVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 13.08.2021.
//

import UIKit

class BaseNavigationVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        clearNavigationBarBackground()
    }
    
    private func clearNavigationBarBackground() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.backgroundColor = .clear
    }
    
}
