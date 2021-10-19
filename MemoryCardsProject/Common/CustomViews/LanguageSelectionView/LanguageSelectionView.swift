//
//  HorizontalItemSelectionView.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 11.10.2021.
//

import UIKit
import RxLocalizer

class LanguageSelectionView: UIView {
            
    private class FlagViewTapGesture: UITapGestureRecognizer {
        var action: () -> Void = {}
    }
    
    var activeFlagView: SelectableItem? {
        didSet {
            activeFlagView?.addBorderCircle()
        }
        
        willSet {
            activeFlagView?.removeBorderCircle()
        }
    }
    
    var flagsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(flagsStackView)
        createFlagViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setBorderCircleForDefaultLanguage()
    }
    
    private func setBorderCircleForDefaultLanguage() {
        layoutIfNeeded()
        activeFlagView?.removeBorderCircle()
        activeFlagView?.addBorderCircle()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            flagsStackView.topAnchor.constraint(equalTo: topAnchor),
            flagsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            flagsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            flagsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
        
    fileprivate func setDefaultActiveFlagView(_ language: AppLanguage, _ flagView: SelectableItem) {
        if language == AppLanguage.defaultLanguage {
            activeFlagView = flagView
        }
    }
    
    private func createFlagViews() {
        for language in AppLanguage.allCases {
            let flagView = SelectableItem()
            flagView.flagImageView.image = UIImage(named: language.rawValue)
            setDefaultActiveFlagView(language, flagView)
            
            let tapGesture = FlagViewTapGesture(target: self, action: #selector(tapped))
            tapGesture.action = { [weak self] in
                self?.activeFlagView = flagView
                AppLocalization.shared.language = language
                Localizer.shared.changeLanguage.accept(language.rawValue)
            }
            flagView.addGestureRecognizer(tapGesture)
            
            flagsStackView.addArrangedSubview(flagView)
        }
    }
    
    @objc private func tapped(sender: FlagViewTapGesture) {
        sender.action()
    }
}

