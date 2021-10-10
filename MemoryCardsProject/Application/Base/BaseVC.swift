//
//  BaseVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 3.10.2021.
//

import UIKit
import RxCocoa
import RxSwift
import RxTheme

class BaseVC: UIViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeNavBar()
    }
    
    private func customizeNavBar() {
        navigationController?.navigationBar.theme.barStyle = themeResource { $0.navBarStyle }
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.theme.tintColor = themeResource { $0.tintColor }
        navigationController?.navigationBar.theme.titleTextAttributes = themeResource { $0.navigationBarTitleTextAttributes }
        navigationItem.backButtonTitle = ""
    }
}
