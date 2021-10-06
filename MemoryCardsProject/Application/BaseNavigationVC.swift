//
//  BaseNavigationVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 13.08.2021.
//

import UIKit

class BaseNavigationVC: UINavigationController, UINavigationBarDelegate {

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
  
    func askUserForConfirmation() {
        let alertController = UIAlertController(title: "Cancel Insertion",
                                                message: "Do you really want to go back? If you proceed, all the inserted data will be lost.",
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Yes, cancel",
                                                style: .cancel,
                                                handler: { [weak self] _ in
                                                    self?.popViewController(animated: true)
                                                }))
        
        alertController.addAction(UIAlertAction(title: "No, continue",
                                                style: .default,
                                                handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }

    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        guard let viewControllerTag = item.viewControllerTag else { return true }

        switch viewControllerTag {
        case .askUserForConfirmation:
            self.askUserForConfirmation()
            return false
        case .popToRootVC:
            self.popToRootViewController(animated: true)
            return false
        }
    }
}

enum ViewControllerTag: Int {
    case askUserForConfirmation = 1
    case popToRootVC = 2
}

extension UINavigationItem {
    private var tag: Int? {
        get {
            self.value(forKey: "tag") as? Int
        }
        set {
            self.setValue(newValue ?? 0, forKey: "tag")
        }
    }
    
    var viewControllerTag: ViewControllerTag? {
        get {
            guard let tag = self.tag else { return nil }
            return ViewControllerTag(rawValue: tag)
        }
        set {
            self.tag = newValue?.rawValue
        }
    }
}


