//
//  BaseVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 3.10.2021.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        revertCustomizedNavBar()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        customizeNavBar()
    }
    
    private func customizeNavBar() {
        navigationController?.navigationBar.tintColor = .systemGreen
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
    }
    
    private func revertCustomizedNavBar() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .clear
    }

}
