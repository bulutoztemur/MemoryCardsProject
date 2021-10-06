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
        //revertCustomizedNavBar()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //customizeNavBar()
    }
    
    func customizeNavBar() {
        navigationController?.navigationBar.tintColor = .systemGreen
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
    }
    
    func revertCustomizedNavBar() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .clear
    }

}
