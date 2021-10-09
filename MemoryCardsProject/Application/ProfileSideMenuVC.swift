//
//  ProfileSideMenuVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 15.08.2021.
//

import UIKit

class ProfileSideMenuVC: UIViewController {
    
    var mainStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var themeStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var themeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dark Mode"
        label.theme.textColor = themeResource { $0.textColor }
        return label
    }()

    var themeSwitch: UISwitch = {
        let themeSwitch = UISwitch()
        themeSwitch.isOn = true
        themeSwitch.translatesAutoresizingMaskIntoConstraints = false
        themeSwitch.tintColor = .darkGray
        themeSwitch.onTintColor = .darkGray
        themeSwitch.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        themeSwitch.thumbTintColor = .systemGreen
        themeSwitch.layer.cornerRadius = 16
        themeSwitch.layer.masksToBounds = true
        themeSwitch.addTarget(self, action: #selector(didChangeThemeSwitchValue), for: .valueChanged)
        return themeSwitch
    }()
    
    @objc func didChangeThemeSwitchValue() {
        themeSwitch.isOn ? themeService.switch(.dark) : themeService.switch(.light)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.theme.backgroundColor = themeResource { $0.profileViewBgColor }
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        themeStackView.addArrangedSubview(themeLabel)
        themeStackView.addArrangedSubview(themeSwitch)
        mainStackView.addArrangedSubview(themeStackView)
        view.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
        ])
    }
    
    
}
