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
    
    var timerMilliseconds: Int = 0 {
        didSet {
            resultView.timeLabel.text = timerMilliseconds.stringFromTimeInterval()
        }
    }
    
    var mistakeCount: Int = 0 {
        didSet {
            resultView.mistakeLabel.text = String(mistakeCount)
        }
    }
    
    var category: CategoryEnum? {
        didSet {
            resultView.categoryLabel.text = "\(category?.dimension.first ?? 0) x \(category?.dimension.second ?? 0)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        navigationItem.viewControllerTag = .popToRootVC
        navigationItem.title = "Result"
        view.addSubview(resultView)
        setupConstraints()
    }
    
    private func setupConstraints() {
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
