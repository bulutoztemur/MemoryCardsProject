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
        self.navigationItem.leftBarButtonItem = createLeftBarButton()
        view.addSubview(resultView)
        
        NSLayoutConstraint.activate([
            resultView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            resultView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

    }
    
    func createLeftBarButton() -> UIBarButtonItem {
        let image = UIImage(named: "back")
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.setTitle("Back", for: .normal)
        button.sizeToFit()
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        button.setTitleColor(.systemGreen, for: .normal)
        button.addTarget(self, action: #selector(showConfirmationAlert), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    @objc func showConfirmationAlert() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
