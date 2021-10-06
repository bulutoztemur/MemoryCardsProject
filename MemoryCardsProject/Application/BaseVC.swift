//
//  BaseVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 3.10.2021.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeNavBar()
    }
    
    private func customizeNavBar() {
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.systemGreen
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemGreen]
        navigationItem.backButtonTitle = ""
    }

    

}
