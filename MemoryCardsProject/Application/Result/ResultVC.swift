//
//  ResultVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 3.10.2021.
//

import UIKit

class ResultVC: BaseVC {
    
    var resultView: ResultView = {
        var resultView = ResultView()
        resultView.translatesAutoresizingMaskIntoConstraints = false
        return resultView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        navigationItem.viewControllerTag = .popToRootVC
        view.addSubview(resultView)
        
        NSLayoutConstraint.activate([
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

        ])
        
        NSLayoutConstraint(item: resultView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 0.8,
                           constant: 0)
            .isActive = true
        
        

    }
        
    @objc func showConfirmationAlert() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
