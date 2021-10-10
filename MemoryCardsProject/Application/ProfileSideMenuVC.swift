//
//  ProfileSideMenuVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 15.08.2021.
//

import UIKit
import RxSwift
import RxCocoa


class ProfileSideMenuVC: UIViewController {
    let disposeBag = DisposeBag()
    
    var mainStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var themeStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    var themeLabel: UILabel = {
        let label = UILabel()
        label.text = "Dark Mode"
        label.font = AppFont.semiboldFontMedium
        label.theme.textColor = themeResource { $0.textColor }
        return label
    }()

    var themeSwitch: UISwitch = {
        let themeSwitch = UISwitch()
        themeSwitch.isOn = true
        themeSwitch.tintColor = .darkGray
        themeSwitch.onTintColor = .darkGray
        themeSwitch.backgroundColor = .lightGray
        themeSwitch.theme.thumbTintColor = themeResource { $0.tintColor }
        themeSwitch.layer.cornerRadius = 16
        themeSwitch.layer.masksToBounds = true
        themeSwitch.addTarget(self, action: #selector(didChangeThemeSwitchValue), for: .valueChanged)
        return themeSwitch
    }()
    
    var fontSizeArrangeStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    var fontSizeSlider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 2
        slider.isContinuous = false
        slider.theme.thumbTintColor = themeResource { $0.tintColor }
        slider.theme.minimumTrackTintColor = themeResource { $0.tintColor }
        return slider
    }()
    
    var smallFontLabel: UILabel = {
        let label = UILabel()
        label.text = "Aa"
        label.font = AppFont.semiboldFontSmall
        label.theme.textColor = themeResource { $0.textColor }
        return label
    }()
    
    var largeFontLabel: UILabel = {
        let label = UILabel()
        label.text = "Aa"
        label.font = AppFont.semiboldFontLarge
        label.theme.textColor = themeResource { $0.textColor }
        return label
    }()
    
    @objc func didChangeThemeSwitchValue() {
        themeSwitch.isOn ? themeService.switch(.dark) : themeService.switch(.light)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.theme.backgroundColor = themeResource { $0.profileViewBgColor }
        setupView()
        setupConstraints()
        bind()
    }
    
    private func setupView() {
        themeStackView.addArrangedSubview(themeLabel)
        themeStackView.addArrangedSubview(themeSwitch)
        fontSizeArrangeStackView.addArrangedSubview(smallFontLabel)
        fontSizeArrangeStackView.addArrangedSubview(fontSizeSlider)
        fontSizeArrangeStackView.addArrangedSubview(largeFontLabel)
        mainStackView.addArrangedSubview(themeStackView)
        mainStackView.addArrangedSubview(fontSizeArrangeStackView)
        view.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func bind() {
        
        fontSizeSlider.rx.value
            .map { round($0)}
            .subscribe(onNext: { [weak self] val in
                self?.fontSizeSlider.setValue(val, animated: true)
                self?.themeLabel.font = AppFont.fontArrangerValues[Int(val)]

            })
             .disposed(by: disposeBag)

        
    }
    
}
