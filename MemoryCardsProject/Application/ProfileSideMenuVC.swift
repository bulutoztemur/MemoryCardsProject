//
//  ProfileSideMenuVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 15.08.2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxLocalizer

class ProfileSideMenuVC: UIViewController {
    let disposeBag = DisposeBag()
    static let fontArrangerValues = [AppFont.semiboldFontSmall!, AppFont.semiboldFontMedium!, AppFont.semiboldFontLarge!]
    
    var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var profileImageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    var profileImageCircleBorderView: UIView = {
        let insideView = UIView()
        insideView.translatesAutoresizingMaskIntoConstraints = false
        insideView.layer.borderColor = UIColor.black.cgColor
        insideView.layer.borderWidth = 1
        insideView.theme.backgroundColor = themeResource { $0.greenToWhite }
        return insideView
    }()
    
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        var image = UIImage(named: "profile-user")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        label.font = AppFont.semiboldFontMedium
        label.theme.textColor = themeResource { $0.textColor }
        return label
    }()
    
    var themeSwitch: UISwitch = {
        let themeSwitch = UISwitch()
        themeSwitch.isOn = themeService.type ==  .dark
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
        slider.setValue(GlobalSettings.fontSize, animated: true)
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
    
    var langStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    var langLabel: UILabel = {
        let label = UILabel()
        label.text = "Language"
        label.font = AppFont.semiboldFontLarge
        label.theme.textColor = themeResource { $0.textColor }
        return label
    }()
    
    var langView: LanguageSelectionView = {
       let langView = LanguageSelectionView()
        langView.translatesAutoresizingMaskIntoConstraints = false
        return langView
    }()
    
    @objc func didChangeThemeSwitchValue() {
        themeSwitch.isOn ? themeService.switch(.dark) : themeService.switch(.light)
        GlobalSettings.darkModeActive = themeService.type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.theme.backgroundColor = themeResource { $0.profileViewBgColor }
        setupView()
        setupConstraints()
        setProfileImageCornerRadius()
        bind()
    }
    
    private func setProfileImageCornerRadius() {
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        profileImageCircleBorderView.layer.cornerRadius = profileImageCircleBorderView.frame.width / 2
    }
    
    private func setupView() {
        profileImageCircleBorderView.addSubview(profileImageView)
        profileImageContainerView.addSubview(profileImageCircleBorderView)
        themeStackView.addArrangedSubview(themeLabel)
        themeStackView.addArrangedSubview(themeSwitch)
        fontSizeArrangeStackView.addArrangedSubview(smallFontLabel)
        fontSizeArrangeStackView.addArrangedSubview(fontSizeSlider)
        fontSizeArrangeStackView.addArrangedSubview(largeFontLabel)
        langStack.addArrangedSubview(langLabel)
        langStack.addArrangedSubview(langView)
        mainStackView.addArrangedSubview(profileImageContainerView)
        mainStackView.addArrangedSubview(themeStackView)
        mainStackView.addArrangedSubview(fontSizeArrangeStackView)
        mainStackView.addArrangedSubview(langStack)
        view.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileImageCircleBorderView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            profileImageCircleBorderView.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: profileImageCircleBorderView.topAnchor, constant: 4),
            profileImageView.leadingAnchor.constraint(equalTo: profileImageCircleBorderView.leadingAnchor, constant: 4),
            
            profileImageContainerView.centerYAnchor.constraint(equalTo: profileImageCircleBorderView.centerYAnchor),
            profileImageContainerView.centerXAnchor.constraint(equalTo: profileImageCircleBorderView.centerXAnchor),
            profileImageCircleBorderView.topAnchor.constraint(equalTo: profileImageContainerView.topAnchor),
        ])
    }
    
    func resource(dest: UILabel, source: String) {
        Localizer.shared.localized(source)
            .drive(dest.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK:- Bindings
private extension ProfileSideMenuVC {
    func bind() {
        fontSizeSlider.rx.value
            .map { round($0)}
            .subscribe(onNext: { [weak self] val in
                self?.fontSizeSlider.setValue(val, animated: true)
                self?.themeLabel.font = Self.fontArrangerValues[Int(val)]
                self?.langLabel.font = Self.fontArrangerValues[Int(val)]
                GlobalSettings.fontSize = val
            })
            .disposed(by: disposeBag)
        
        Localizer.shared.localized("DarkMode")
            .drive(themeLabel.rx.text)
            .disposed(by: disposeBag)
        
        Localizer.shared.localized("Language")
            .drive(langLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
